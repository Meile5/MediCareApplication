import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/errorHandling/application_messages.dart';
import 'package:medicare/patient/common/patient_data_source.dart';

import 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  final PatientDataSource dataSource;

  PatientCubit({required this.dataSource}) : super(const PatientState());

  Future<void> loadPatient(String patientId) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final patient = await dataSource.getPatientById(patientId);
      emit(state.copyWith(patient: patient, loading: false));
    } catch (e) {
      emit(
        state.copyWith(
          error: ApplicationMessages.failedToRetrieveData.message,
          loading: false,
        ),
      );
    }
  }
}
