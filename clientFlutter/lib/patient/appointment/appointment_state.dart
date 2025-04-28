import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'models_appointments.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentLoading extends AppointmentState {}

final class AppointmentLoaded extends AppointmentState {
  final DoctorAvailabilityResponseDto availableTimes;
  AppointmentLoaded({required this.availableTimes});
}

final class AppointmentError extends AppointmentState {
  final String message;
  AppointmentError({required this.message});
}