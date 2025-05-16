import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/doctor/patient_overview/state/patients_vitals_state.dart';
import 'package:medicare/doctor/patient_overview/utils/patients_overview_data_source.dart';
import '../../../../errorHandling/application_messages.dart';
import '../models/patients_overview_models.dart';

class PatientsVitalsCubit extends Cubit<PatientsVitalsState> {
  final PatientsOverviewDataSource dataSource;

  PatientsVitalsCubit({required this.dataSource})
      : super(PatientsVitalsInitial());

  Future<void> retrievePatientsVitals(String patientId) async {
    emit(PatientsVitalsLoading());
    try {
      final List<VitalsSignsDto> vitals = await dataSource.getPatientVitals(patientId);
      emit(PatientsVitalsLoaded(vitals: vitals));
    } on SocketException catch (_) {
      emit(PatientsVitalsError(message: ApplicationMessages.networkError.message));
    } catch(e) {
      emit(PatientsVitalsError(message: ApplicationMessages.generalError.message));
    }
  }
}
