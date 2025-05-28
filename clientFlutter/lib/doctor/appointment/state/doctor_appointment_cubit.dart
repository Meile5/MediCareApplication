import 'dart:async';
import 'dart:io';
import 'package:medicare/common/event_models/events.dart' as events;
import 'package:medicare/doctor/appointment/models/appointment_model.dart'
    as model;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/auth/auth_prefs.dart';
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
  bool _isSubscribed = false;

  DoctorAppointmentCubit({
    required this.dataSource,
    required this.webSocketService,
  }) : super(DoctorAppointmentInitial()) {
    _subscription = webSocketService.baseEventStream
        .listen(
          (message) {

            if (state is DoctorAppointmentLoaded) {
              final currentAppointments =
                  (state as DoctorAppointmentLoaded).appointments;

              if (message is CancelledAppointment) {
                emit(
                  DoctorAppointmentLoaded(
                    appointments:
                        currentAppointments
                            .where((a) => a.id != message.appointmentId)
                            .toList(),
                  ),
                );
              } else if (message is events.AppointmentDoctorSideDto) {
                final newAppointment = model.AppointmentDoctorSideDto(
                  id: message.id,
                  doctorId: message.doctorId,
                  patientId: message.patientId,
                  status: message.status,
                  notes: message.notes,
                  startTime: message.startTime,
                  endTime: message.endTime,
                );
                emit(
                  DoctorAppointmentLoaded(
                    appointments: [...currentAppointments, newAppointment],
                  ),
                );
              }
            }
          },
          onError: (error) {
            emit(
              DoctorAppointmentError(
                message: ApplicationMessages.serverError.message,
              ),
            );
          },
        );
  }

  Future<void> getDoctorAppointments() async {
    emit(DoctorAppointmentLoading());
    try {
      final List<model.AppointmentDoctorSideDto> appointments =
          await dataSource.getAppointmentsForDoctor();
      emit(DoctorAppointmentLoaded(appointments: appointments));
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

  Future<void> confirmAppointment(
    model.AppointmentDoctorSideDto appt,
    String patientId,
  ) async {
    try {
      await dataSource.confirmAppointment(appt.id, patientId, appt.startTime, appt.endTime);
      print (appt.startTime);

      final chatroom = CreateChatRoomDto(
        doctorId: appt.doctorId,
        patientId: appt.patientId,
        topic: appt.notes,
        startTime: appt.startTime,
        endTime: appt.endTime,
        isFinished: false,
      );

      await dataSource.createChatRoom(chatroom);
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

  Future<void> rejectAppointment(String appointmentId, String patientId) async {
    try {
      await dataSource.rejectAppointment(appointmentId, patientId);
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
    webSocketService.send(
      JoinRoom(roomId: roomId, token: AuthPrefs.jwt).toJson(),
    );
  }

  void unsubscribeFromRoom(String roomId) {
    webSocketService.send(UnsubscribeFromChat(roomId: roomId).toJson());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
