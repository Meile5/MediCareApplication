import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/doctor/patient_overview/state/patients_diagnoses_state.dart';
import 'package:medicare/doctor/patient_overview/utils/patients_overview_data_source.dart';
import '../../../../errorHandling/application_messages.dart';
import '../models/patients_overview_models.dart';

class DiagnosesCubit extends Cubit<DiagnosesState> {
  final PatientsOverviewDataSource dataSource;

  DiagnosesCubit({required this.dataSource})
      : super(DiagnosesInitial());

  Future<void> retrieveDiagnoses(String patientId) async {
    emit(DiagnosesLoading());
    try {
      final List<DiagnosesDto> diagnoses = await dataSource.getPatientsDiagnoses(patientId);
      emit(DiagnosesLoaded(diagnoses: diagnoses));
    } on SocketException catch (_) {
      emit(DiagnosesError(message: ApplicationMessages.networkError.message));
    } catch(e) {
      emit(DiagnosesError(message: ApplicationMessages.generalError.message));
    }
  }


}
