import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/events.dart';
import 'package:medicare/common/websocket_service.dart';
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
    } catch (e) {
      emit(BookingError(message: e.toString()));
    }
  }

  Future<void> bookAppointment(BookAppointmentDto dto) async {
    try {
      final response = await dataSource.bookAppointment(dto);

      if (response.statusCode == 200) {
        print('Appointment booked successfully');
        final currentState = state;
        /*if (currentState is BookingLoaded) {
          emit(BookingLoaded(
            availableTimes: currentState.availableTimes, // Keep previous available times
          ));
        }*/
        emit(BookingSuccessful(message: 'Your appointment is currently pending and waiting for approval!'));
        // emit(...) if needed
      } else {
        emit(BookingError(message: 'Failed to book: ${response.body}'));
      }
    } catch (e) {
      emit(BookingError(message: e.toString()));
    }
  }
}