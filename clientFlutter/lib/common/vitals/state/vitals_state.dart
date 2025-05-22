part of 'vitals_cubit.dart';

abstract class VitalsState {}

class VitalsInitial extends VitalsState {}

//small change
class VitalsUpdated extends VitalsState {
  final double temperature;
  final List<int> ecg;
  final int? heartRate;
  final int? spo2;

  VitalsUpdated({
    required this.temperature,
    required this.ecg,
    this.heartRate,
    this.spo2,
  });
}

class VitalsError extends VitalsState {
  final String message;

  VitalsError({required this.message});
}
