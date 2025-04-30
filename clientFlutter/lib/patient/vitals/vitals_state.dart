part of 'vitals_cubit.dart';

abstract class VitalsState {}

class VitalsInitial extends VitalsState {}

//small change
class VitalsUpdated extends VitalsState {
  final double temperature;
  final double ecg;

  VitalsUpdated({required this.temperature, required this.ecg});
}

class VitalsError extends VitalsState {
  final String message;

  VitalsError({required this.message});
}
