import 'package:flutter/foundation.dart';
import 'package:medicare/patient/common/patient_model.dart';

@immutable
class PatientState {
  final PatientDto? patient;
  final bool loading;
  final String? error;

  const PatientState({this.patient, this.loading = false, this.error});

  PatientState copyWith({PatientDto? patient, bool? loading, String? error}) {
    return PatientState(
      patient: patient ?? this.patient,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}
