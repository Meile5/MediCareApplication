import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/doctor/appointment/models/appointment_model.dart';

import '../../../errorHandling/application_messages.dart';
import '../utils/doctor_appointment_data_source.dart';
import 'doctor_appointment_state.dart';

class DoctorAppointmentCubit extends Cubit<DoctorAppointmentState> {
  final DoctorAppointmentDataSource dataSource;

  DoctorAppointmentCubit({required this.dataSource})
    : super(DoctorAppointmentInitial());

  Future<void> getDoctorAppointments() async {
    emit(DoctorAppointmentLoading());
    developer.log('Fetching appointments...', name: 'DoctorAppointmentCubit');
    try {
      final List<AppointmentDto> appointments =
          await dataSource.getAppointmentsForDoctor();
      developer.log(
        'Appointments fetched: ${appointments.length}',
        name: 'DoctorAppointmentCubit',
      );
      emit(DoctorAppointmentLoaded(appointments: appointments));
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

  Future<void> confirmAppointment(AppointmentDto appt) async {
    try {
      await dataSource.confirmAppointment(appt.id);

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
}
