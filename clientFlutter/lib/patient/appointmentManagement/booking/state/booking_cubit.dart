import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/event_models/events.dart';
import 'package:medicare/common/utility/websocket_service.dart';
import '../../../../common/auth/auth_prefs.dart';
import '../../../../errorHandling/application_messages.dart';
import 'booking_state.dart';
import '../../utils/data_source.dart';
import '../../models/models_for_mapping.dart';
///state manager
class BookingCubit extends Cubit<BookingState> {
  final DataSource dataSource;
  final WebSocketService webSocketService;
  StreamSubscription? _subscription;
  bool _isSubscribed = false;

  BookingCubit({required this.dataSource, required this.webSocketService})
      : super(BookingInitial()) {
    webSocketService.baseEventStream
        .listen((message) {
      if (state is BookingLoaded) {
        final timeSlots = (state  as BookingLoaded).availableTimes;

        if (message is ConfirmedSlot) {
          emit(BookingLoaded(
            availableTimes: timeSlots
                .where((slot) =>
            slot.startTime != message.startTime.toUtc() &&
                slot.endTime != message.endTime.toUtc())
                .toList(),

          ));}
      }

    });}


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
  void joinRoom(String roomId) {
    if (_isSubscribed) return;

    _isSubscribed = true;
    webSocketService.send(
      JoinRoom(roomId: roomId, token: AuthPrefs.jwt).toJson(),
    );
  }

  void unsubscribeFromRoom(String roomId) {
    webSocketService.send(UnsubscribeFromChat(roomId: roomId).toJson());
  }

  /// when widget is disposed we stop listening to the stream
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
