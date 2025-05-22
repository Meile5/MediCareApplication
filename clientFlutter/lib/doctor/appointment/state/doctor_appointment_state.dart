import 'package:flutter/cupertino.dart';
import 'package:medicare/doctor/appointment/models/appointment_model.dart';

@immutable
abstract class DoctorAppointmentState {}

class DoctorAppointmentInitial extends DoctorAppointmentState {}

class DoctorAppointmentLoading extends DoctorAppointmentState {}

class DoctorAppointmentError extends DoctorAppointmentState {
  final String message;
  DoctorAppointmentError({required this.message});
}

class DoctorAppointmentLoaded extends DoctorAppointmentState {
  final List<AppointmentDto> appointments;
  DoctorAppointmentLoaded({required this.appointments});
}
