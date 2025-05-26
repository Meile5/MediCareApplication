import 'package:flutter/material.dart';

@immutable
sealed class CommonWSState {}

final class CommonInitial extends CommonWSState {}

final class CommonLoading extends CommonWSState {}

final class CommonLoaded extends CommonWSState {}

final class CommonError extends CommonWSState {
  final String message;

  CommonError({required this.message});
}
