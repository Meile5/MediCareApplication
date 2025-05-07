import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/models_overview.dart';
import '../utility/data_source_overview.dart';
import 'overview_state.dart';


class OverviewCubit extends Cubit<OverviewState> {
  final DataSourceOverview dataSource;

  OverviewCubit({required this.dataSource})
      : super(OverviewInitial()) {

  }

  Future<void> retrieveClinicInfo(String userId) async {
    emit(ClinicInfoLoading());
    try {
      final List<ClinicInfoDto> clinicInfo = await dataSource.retrieveClinicInfo(userId);
      emit(ClinicInfoLoaded(clinicInfo: clinicInfo));
    } catch (e) {
      emit(ClinicInfoError(message: e.toString()));
    }
  }


}
