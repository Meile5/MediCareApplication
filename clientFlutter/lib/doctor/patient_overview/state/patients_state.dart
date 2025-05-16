import 'package:flutter/cupertino.dart';
import 'package:medicare/patient/appointmentManagement/models/models_for_mapping.dart';

import '../../../patient/common/patient_model.dart';

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
