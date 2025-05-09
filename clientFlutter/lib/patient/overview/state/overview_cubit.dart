import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../errorHandling/application_messages.dart';
import '../models/models_overview.dart';
import '../utility/data_source_overview.dart';
import 'overview_state.dart';


class OverviewCubit extends Cubit<OverviewState> {
  final DataSourceOverview dataSource;

  OverviewCubit({required this.dataSource})
      : super(OverviewInitial());

  Future<void> retrieveClinicInfo() async {
    emit(ClinicInfoLoading());
    try {
      final List<ClinicInfoDto> clinicInfo = await dataSource.retrieveClinicInfo();
      emit(ClinicInfoLoaded(clinicInfo: clinicInfo));
    } on SocketException catch (_) {
      emit(ClinicInfoError(message: ApplicationMessages.networkError.message));
    } catch(e) {
      emit(ClinicInfoError(message: ApplicationMessages.generalError.message));
    }
  }


}
