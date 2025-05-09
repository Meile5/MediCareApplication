import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/events.dart';
import 'package:medicare/common/websocket_service.dart';
import '../../../../errorHandling/application_messages.dart';
import 'appointment_state.dart';
import '../../utils/data_source.dart';
import '../../models/models_for_mapping.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final DataSource dataSource;
  final WebSocketService webSocketService;

  AppointmentCubit({required this.dataSource, required this.webSocketService})
      : super(AppointmentInitial()) {
    webSocketService.send(JoinDoctorRoom(roomId: "user-doctor-1").toJson());

    webSocketService.stream
        .map((rawEvent) => BaseEventMapper.fromJson(rawEvent))
        .listen((message) {
      if (message is BroadcastBookedSlot) {
        print(message.id);
      }
    });
  }

  Future<void> getFutureAppointments(String userId) async {
    emit(AppointmentLoading());
    try {
      final List<FutureAppointmentsDto> futureAppointments = await dataSource.getFutureAppointments(userId);
      emit(FutureAppointmentsLoaded(futureAppointments: futureAppointments));
    } on SocketException catch (_) {
      emit(AppointmentError(message: ApplicationMessages.networkError.message));
    } catch(e) {
      emit(AppointmentError(message: ApplicationMessages.generalError.message));
    }
  }

  Future<void> getPastAppointments(String userId) async {
    emit(AppointmentLoading());
    try {
      final pastAppointments = await dataSource.getPastAppointments(userId);
      emit(PastAppointmentsLoaded(pastAppointments: pastAppointments));
    } on SocketException catch (_) {
      emit(AppointmentError(message: ApplicationMessages.networkError.message));
    } catch(e) {
      emit(AppointmentError(message: ApplicationMessages.generalError.message));
    }
  }

  Future<void> cancelAppointment(CancelAppointmentDto dto) async {
    try {
      final response = await dataSource.cancelAppointments(dto);
      if (response.statusCode == 200) {
        /* Remove just the canceled appointment from state */
        if (state is FutureAppointmentsLoaded) {
          final currentAppointments = (state as FutureAppointmentsLoaded).futureAppointments;
          final updatedAppointments = currentAppointments
              .where((appointment) => appointment.id != dto.id)
              .toList();

          emit(FutureAppointmentsLoaded(futureAppointments: updatedAppointments));
        }
      } else if (response.statusCode >= 500) {
        emit(AppointmentError(message: ApplicationMessages.serverError.message));
      } else if (response.statusCode >= 400) {
        emit(AppointmentError(message: ApplicationMessages.badRequestError.message));
      }
    } on SocketException catch (_) {
      emit(AppointmentError(message: ApplicationMessages.networkError.message));
    } catch(e) {
      emit(AppointmentError(message: ApplicationMessages.generalError.message));
    }
  }
}
