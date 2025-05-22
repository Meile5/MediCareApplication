/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/patient/overview/models/models_overview.dart';

import 'doctor_data_source.dart';

class ClinicState {
  final ClinicInfoDto? clinic;
  final bool loading;
  final String? error;

  ClinicState({required this.clinic, this.loading = false, this.error});
}

class ClinicCubit extends Cubit<ClinicState> {
  final DoctorDataSource dataSource;

  ClinicCubit({required this.dataSource}) : super(ClinicState());

  Future<void> loadClinic() async {
    emit(ClinicState(loading: true));
    print("Loading clinic data...");
    try {
      final clinic = await dataSource.retrieveClinicInfo();
      print("clinic data loaded: $clinic");
      emit(ClinicState(clinic: clinic));
    } catch (e) {
      print("Error loading clinic data: $e");
      emit(ClinicState(error: e.toString()));
    }
  }
}
*/
