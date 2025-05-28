import 'package:flutter_bloc/flutter_bloc.dart';

import '../../errorHandling/application_messages.dart';
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
    try {
      final doctor = await dataSource.getDoctorById(doctorId);
      emit(DoctorState(doctor: doctor));
    } catch (e) {
      emit(DoctorState(error: ApplicationMessages.generalError.message));
    }
  }
}
