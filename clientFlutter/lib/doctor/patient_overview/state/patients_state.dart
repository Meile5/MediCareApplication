import '../../../patient/common/patient_model.dart';
import 'package:flutter/material.dart';
@immutable
sealed class PatientsState {}

final class PatientsInitial extends PatientsState {}

final class PatientsLoading extends PatientsState {}

final class PatientsError extends PatientsState {
  final String message;
  PatientsError({required this.message});
}

final class PatientsLoaded extends PatientsState {
  final List<PatientDto> patients;
  PatientsLoaded({required this.patients});
}
