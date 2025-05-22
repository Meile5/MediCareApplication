import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_data_source.dart';
import 'doctor_model.dart';

class DoctorState {
  final DoctorDto? doctor;
  final bool loading;
  final String? error;

  DoctorState({this.doctor, this.loading = false, this.error});
}

class DoctorCubit extends Cubit<DoctorState> {
  final DoctorDataSource dataSource;

  DoctorCubit({required this.dataSource}) : super(DoctorState());

  Future<void> loadDoctor(String doctorId) async {
    emit(DoctorState(loading: true));
    print("Loading doctor data...");
    try {
      final doctor = await dataSource.getDoctorById(doctorId);
      print("Doctor data loaded: $doctor");
      emit(DoctorState(doctor: doctor));
    } catch (e) {
      print("Error loading doctor data: $e");
      emit(DoctorState(error: e.toString()));
    }
  }
}
