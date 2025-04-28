part of 'vitals_cubit.dart';

abstract class VitalsState {}

class VitalsInitial extends VitalsState {}

class VitalsUpdated extends VitalsState {
  final double temperature;

  VitalsUpdated({required this.temperature});
}

class VitalsError extends VitalsState {
  final String message;

  VitalsError({required this.message});
}
