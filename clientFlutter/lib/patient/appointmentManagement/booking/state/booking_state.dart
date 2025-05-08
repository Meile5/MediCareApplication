import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../models/models_for_mapping.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingLoaded extends BookingState {
  final List<AvailabilityDto> availableTimes;
  BookingLoaded({required this.availableTimes});
}

final class BookingBooked extends BookingState {
  final String message;
  BookingBooked({required this.message});
}

final class BookingError extends BookingState {
  final String message;
  BookingError({required this.message});
}

final class BookingSuccessful extends BookingState {
  final String message;
  BookingSuccessful({required this.message});
}
