import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/patient/common/patient_data_source.dart';
import 'package:medicare/patient/common/patient_model.dart';

class PatientState {
  final PatientDto? patient;
  final bool loading;
  final String? error;

  PatientState({this.patient, this.loading = false, this.error});
}

class PatientCubit extends Cubit<PatientState> {
  final PatientDataSource dataSource;

  PatientCubit({required this.dataSource}) : super(PatientState());

  Future<void> loadPatient(String patientId) async {
    emit(PatientState(loading: true));
    print("Loading patient data...");
    try {
      final patient = await dataSource.getPatientById(patientId);
      print("Patient data loaded: $patient");
      emit(PatientState(patient: patient));
    } catch (e) {
      print("Error loading patient data: $e");
      emit(PatientState(error: e.toString()));
    }
  }
}
