import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/auth/auth_prefs.dart';
import '../../../../common/event_models/events.dart';
import '../../../../common/utility/websocket_service.dart';
import '../../../../errorHandling/application_messages.dart';
import '../../models/models_for_mapping.dart';
import '../../utils/data_source.dart';
import 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final DataSource dataSource;
  final WebSocketService webSocketService;
  StreamSubscription? _subscription;
  final Set<String> _joinedRooms = {};
  List<FutureAppointmentsDto> _futureAppointments = [];

  AppointmentCubit({required this.dataSource, required this.webSocketService})
    : super(AppointmentInitial()) {
    _subscription = webSocketService.stream
        .map((rawEvent) => BaseEventMapper.fromJson(rawEvent))
        .listen(
          (message) {
            if (message is CancelledAppointment) {
              _futureAppointments.removeWhere(
                (a) => a.id == message.appointmentId,
              );
              print('Cancelled appointment: ${message.appointmentId}');
              emit(
                FutureAppointmentsLoaded(
                  futureAppointments: List.from(_futureAppointments),
                ),
              );
            }
          },
          onError: (error) {
            emit(
              AppointmentError(
                message: ApplicationMessages.serverError.message,
              ),
            );
          },
        );
  }

  Future<void> getFutureAppointments() async {
    emit(AppointmentLoading());
    try {
      final futureAppointments = await dataSource.getFutureAppointments();
      _futureAppointments = futureAppointments;
      emit(FutureAppointmentsLoaded(futureAppointments: _futureAppointments));
    } on SocketException {
      emit(AppointmentError(message: ApplicationMessages.networkError.message));
    } catch (e) {
      emit(AppointmentError(message: ApplicationMessages.generalError.message));
    }
  }

  Future<void> getPastAppointments() async {
    emit(AppointmentLoading());
    try {
      final pastAppointments = await dataSource.getPastAppointments();
      emit(PastAppointmentsLoaded(pastAppointments: pastAppointments));
    } on SocketException {
      emit(AppointmentError(message: ApplicationMessages.networkError.message));
    } catch (e) {
      emit(AppointmentError(message: ApplicationMessages.generalError.message));
    }
  }

  Future<void> cancelAppointment(CancelAppointmentDto dto) async {
    try {
      final response = await dataSource.cancelAppointments(dto);
      if (response.statusCode == 200) {
        if (state is FutureAppointmentsLoaded) {
          final currentAppointments =
              (state as FutureAppointmentsLoaded).futureAppointments;
          final updatedAppointments =
              currentAppointments
                  .where((appointment) => appointment.id != dto.id)
                  .toList();
          emit(
            FutureAppointmentsLoaded(futureAppointments: updatedAppointments),
          );
        }
      } else if (response.statusCode >= 500) {
        emit(
          AppointmentError(message: ApplicationMessages.serverError.message),
        );
      } else {
        emit(
          AppointmentError(
            message: ApplicationMessages.badRequestError.message,
          ),
        );
      }
    } on SocketException {
      emit(AppointmentError(message: ApplicationMessages.networkError.message));
    } catch (e) {
      emit(AppointmentError(message: ApplicationMessages.generalError.message));
    }
  }

  void joinRoom(String roomId) {
    if (_joinedRooms.contains(roomId)) return;

    _joinedRooms.add(roomId);
    webSocketService.send(
      JoinRoom(roomId: roomId, token: AuthPrefs.jwt).toJson(),
    );
    print('Subscribed to Room: $roomId');
  }

  void unsubscribeAllRooms() {
    for (final roomId in _joinedRooms) {
      webSocketService.send(
        UnsubscribeFromChat(roomId: roomId).toJson(),
      );
      print("Unsubscribed from WebSocket room: $roomId");
    }
    _joinedRooms.clear();
  }

  @override
  Future<void> close() {
    unsubscribeAllRooms();
    _subscription?.cancel();
    return super.close();
  }
}
