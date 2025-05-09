import 'package:flutter/cupertino.dart';
import 'package:medicare/patient/overview/models/models_overview.dart';

@immutable
sealed class OverviewState {}

final class OverviewInitial extends OverviewState {}

final class ClinicInfoLoading extends OverviewState {}

final class ClinicInfoError extends OverviewState {
  final String message;
  ClinicInfoError({required this.message});
}

final class ClinicInfoLoaded extends OverviewState {
  final List<ClinicInfoDto> clinicInfo;
  ClinicInfoLoaded({required this.clinicInfo});
}
