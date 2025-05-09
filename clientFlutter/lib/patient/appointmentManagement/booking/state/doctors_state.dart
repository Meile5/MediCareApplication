import 'package:flutter/cupertino.dart';
import 'package:medicare/patient/appointmentManagement/models/models_for_mapping.dart';

@immutable
sealed class DoctorsState {}

final class OverviewInitial extends DoctorsState {}

final class DoctorsLoading extends DoctorsState {}

final class DoctorsError extends DoctorsState {
  final String message;
  DoctorsError({required this.message});
}

final class DoctorsLoaded extends DoctorsState {
  final List<ClinicDoctorDto> doctors;
  DoctorsLoaded({required this.doctors});
}
