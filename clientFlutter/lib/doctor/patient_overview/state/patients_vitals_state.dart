import 'package:flutter/cupertino.dart';
import 'package:medicare/patient/appointmentManagement/models/models_for_mapping.dart';

import '../../../patient/common/patient_model.dart';
import '../models/patients_overview_models.dart';

@immutable
sealed class PatientsVitalsState {}

final class PatientsVitalsInitial extends PatientsVitalsState {}

final class PatientsVitalsLoading extends PatientsVitalsState {}

final class PatientsVitalsError extends PatientsVitalsState {
  final String message;
  PatientsVitalsError({required this.message});
}

final class PatientsVitalsLoaded extends PatientsVitalsState {
  final List<VitalsSignsDto> vitals;
  PatientsVitalsLoaded({required this.vitals});
}
