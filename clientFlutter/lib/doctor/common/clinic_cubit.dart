import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../patient/overview/models/models_overview.dart';
import 'doctor_data_source.dart';

class ClinicInfoState {
  final List<ClinicInfoDto>? clinics;
  final bool loading;
  final String? error;

  ClinicInfoState({this.clinics, this.loading = false, this.error});
}

class ClinicInfoCubit extends Cubit<ClinicInfoState> {
  final DoctorDataSource dataSource;

  ClinicInfoCubit({required this.dataSource}) : super(ClinicInfoState());

  Future<void> loadClinicInfo() async {
    emit(ClinicInfoState(loading: true));
    print("Loading clinic info...");
    try {
      final clinics = await dataSource.retrieveClinicInfo();
      print("Clinic info loaded: $clinics");
      emit(ClinicInfoState(clinics: clinics));
    } catch (e) {
      print("Error loading clinic info: $e");
      emit(ClinicInfoState(error: e.toString()));
    }
  }
}
