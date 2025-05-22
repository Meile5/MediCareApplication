import 'package:flutter/cupertino.dart';

import '../models/patients_overview_models.dart';

@immutable
sealed class DiagnosesState {}

final class DiagnosesInitial extends DiagnosesState {}

final class DiagnosesLoading extends DiagnosesState {}

final class DiagnosesError extends DiagnosesState {
  final String message;
  DiagnosesError({required this.message});
}

final class DiagnosesLoaded extends DiagnosesState {
  final List<DiagnosesDto> diagnoses;
  DiagnosesLoaded({required this.diagnoses});
}
