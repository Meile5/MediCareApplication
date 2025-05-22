import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/doctor/patient_overview/state/patients_state.dart';
import 'package:medicare/doctor/patient_overview/utils/patients_overview_data_source.dart';

import '../../../../errorHandling/application_messages.dart';
import '../../../patient/common/patient_model.dart';

class PatientsCubit extends Cubit<PatientsState> {
  final PatientsOverviewDataSource dataSource;

  PatientsCubit({required this.dataSource}) : super(PatientsInitial());

  Future<void> retrievePatients(String clinicId) async {
    emit(PatientsLoading());
    developer.log('Fetching patients...', name: 'PatientsCubit');

    try {
      final List<PatientDto> patients = await dataSource.getPatients(clinicId);
      developer.log(
        'Patients fetched: ${patients.length}',
        name: 'PatientsCubit',
      );
      emit(PatientsLoaded(patients: patients));
    } on SocketException catch (_) {
      emit(PatientsError(message: ApplicationMessages.networkError.message));
    } catch (e) {
      emit(PatientsError(message: ApplicationMessages.generalError.message));
    }
  }
}
