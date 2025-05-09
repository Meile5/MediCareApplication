import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/events.dart';
import 'package:medicare/common/websocket_service.dart';
import '../../../../errorHandling/application_messages.dart';
import 'booking_state.dart';
import '../../utils/data_source.dart';
import '../../models/models_for_mapping.dart';
class BookingCubit extends Cubit<BookingState> {
  final DataSource dataSource;
  final WebSocketService webSocketService;

  BookingCubit({required this.dataSource, required this.webSocketService})
      : super(BookingInitial()) {
    webSocketService.send(JoinDoctorRoom(roomId: "user-doctor-1").toJson());

    webSocketService.stream
        .map((rawEvent) => BaseEventMapper.fromJson(rawEvent))
        .listen((message) {
      if (message is BroadcastBookedSlot) {
        print(message.id);
      }
    });
  }

  Future<void> loadAvailableTimes(String id) async {
    emit(BookingLoading());
    try {
      final availableTimes = await dataSource.getAvailability(id);

      emit(BookingLoaded(availableTimes: availableTimes));
    } on SocketException catch (_) {
      emit(BookingError(message: ApplicationMessages.networkError.message));
    } catch(e) {
      emit(BookingError(message: ApplicationMessages.generalError.message));
    }
  }

  Future<void> bookAppointment(BookAppointmentRequest dto) async {
    try {
      final response = await dataSource.bookAppointment(dto);

      if (response.statusCode == 200) {
        emit(BookingSuccessful(
            message: ApplicationMessages.waitingForApproval.message));
      } else if (response.statusCode >= 500) {
        emit(BookingError(message: ApplicationMessages.serverError.message));
      } else if (response.statusCode >= 400) {
        emit(
            BookingError(message: ApplicationMessages.badRequestError.message));
      }
    } on SocketException catch (_) {
      emit(BookingError(message: ApplicationMessages.networkError.message));
    } catch(e) {
      emit(BookingError(message: ApplicationMessages.generalError.message));
    }
  }
}
