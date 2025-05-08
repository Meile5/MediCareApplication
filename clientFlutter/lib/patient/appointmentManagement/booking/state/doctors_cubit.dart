import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/patient/appointmentManagement/models/models_for_mapping.dart';
import '../../utils/data_source.dart';
import 'doctors_state.dart';



class DoctorsCubit extends Cubit<DoctorsState> {
  final DataSource dataSource;

  DoctorsCubit({required this.dataSource})
      : super(OverviewInitial()) {
  }

  Future<void> retrieveDoctors(String clinicId) async {
    emit(DoctorsLoading());
    try {
      final List<ClinicDoctorDto> doctors = await dataSource.getDoctors(clinicId);
      emit(DoctorsLoaded(doctors: doctors));
    } catch (e) {
      emit(DoctorsError(message: e.toString()));
    }
  }


}
