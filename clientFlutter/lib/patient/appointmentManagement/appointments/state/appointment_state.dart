import 'package:flutter/cupertino.dart';
import '../../models/models_for_mapping.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentLoading extends AppointmentState {}

final class AppointmentError extends AppointmentState {
    final String message;
    AppointmentError({required this.message});
}

final class FutureAppointmentsLoaded extends AppointmentState {
    final List<FutureAppointmentsDto> futureAppointments;
    FutureAppointmentsLoaded({required this.futureAppointments});
}

final class PastAppointmentsLoaded extends AppointmentState {
    final List<PastAppointmentsDto> pastAppointments;
    PastAppointmentsLoaded({required this.pastAppointments});
}