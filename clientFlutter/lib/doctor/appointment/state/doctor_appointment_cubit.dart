import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/doctor/appointment/models/appointment_model.dart';

import '../../../common/event_models/events.dart';
import '../../../common/utility/websocket_service.dart';
import '../../../errorHandling/application_messages.dart';
import '../utils/doctor_appointment_data_source.dart';
import 'doctor_appointment_state.dart';

class DoctorAppointmentCubit extends Cubit<DoctorAppointmentState> {
  final DoctorAppointmentDataSource dataSource;
  final WebSocketService webSocketService;
  StreamSubscription? _subscription;
  List<AppointmentDto> _appointments = [];
  bool _isSubscribed = false;

  DoctorAppointmentCubit({required this.dataSource, required this.webSocketService,})
    : super(DoctorAppointmentInitial()){
    _subscription = webSocketService.stream.listen(
          (rawEvent) {
        try {
          final event = BaseEventMapper.fromJson(rawEvent);

          if (event is CancelledAppointment) {
            print('Cancelled appointment event received: ${event.appointmentId}');
            _appointments.removeWhere((a) => a.id == event.appointmentId);
            emit(DoctorAppointmentLoaded(appointments: List.from(_appointments)));
          }
        } catch (e) {
          emit(
            DoctorAppointmentError(
              message: ApplicationMessages.failedToRetrieveData.message,
            ),
          );
        }
      },
      onError: (error) {
        emit(DoctorAppointmentError(message: ApplicationMessages.serverError.message));
      },
    );

  }

  Future<void> getDoctorAppointments() async {
    emit(DoctorAppointmentLoading());
    try {
      final List<AppointmentDto> appointments =
          await dataSource.getAppointmentsForDoctor();
      _appointments = appointments;
      emit(DoctorAppointmentLoaded(appointments: _appointments));
    } on SocketException catch (_) {
      emit(
        DoctorAppointmentError(
          message: ApplicationMessages.networkError.message,
        ),
      );
    } catch (e, stacktrace) {
      developer.log(
        'Error fetching appointments: $e',
        name: 'DoctorAppointmentCubit',
        error: e,
        stackTrace: stacktrace,
      );
      emit(
        DoctorAppointmentError(
          message: ApplicationMessages.generalError.message,
        ),
      );
    }
  }

  Future<void> confirmAppointment(String appointmentId) async {
    try {
      await dataSource.confirmAppointment(appointmentId);
    } on SocketException catch (_) {
      emit(
        DoctorAppointmentError(
          message: ApplicationMessages.networkError.message,
        ),
      );
    } catch (e) {
      emit(
        DoctorAppointmentError(
          message: ApplicationMessages.generalError.message,
        ),
      );
    }
  }

  Future<void> rejectAppointment(String appointmentId) async {
    try {
      await dataSource.rejectAppointment(appointmentId);
    } on SocketException catch (_) {
      emit(
        DoctorAppointmentError(
          message: ApplicationMessages.networkError.message,
        ),
      );
    } catch (e) {
      emit(
        DoctorAppointmentError(
          message: ApplicationMessages.generalError.message,
        ),
      );
    }
  }
  void joinRoom(String roomId) {
    if (_isSubscribed) return;

    _isSubscribed = true;
    webSocketService.send(JoinRoom(roomId: roomId).toJson());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
