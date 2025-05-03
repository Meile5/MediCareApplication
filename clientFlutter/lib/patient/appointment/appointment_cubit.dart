import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/events.dart';
import 'package:medicare/common/websocket_service.dart'; // <-- Import your service here

import 'appointment_state.dart';
import 'data_source.dart';
import 'models_for_mapping.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final DataSource dataSource;
  final WebSocketService webSocketService;

  AppointmentCubit({required this.dataSource, required this.webSocketService})
    : super(AppointmentInitial()) {
    webSocketService.send(JoinDoctorRoom(roomId: "user-doctor-1").toJson());

    webSocketService.stream
        .map((rawEvent) => BaseEventMapper.fromJson(rawEvent))
        .listen((message) {
          if (message is BroadcastBookedSlot) {
            print(message.id);
          }
        });
  }
  Future<void> getFutureAppointments(String userId) async {
    emit(AppointmentLoading());
    try {
      final List<FutureAppointmentsDto> futureAppointments = await dataSource.getFutureAppointments(userId);
      print(futureAppointments.toString());

      emit(FutureAppointmentsLoaded(futureAppointments: futureAppointments));
    }catch (e) {
      emit(AppointmentError(message: e.toString()));
    }
  }


  Future<void> loadAvailableTimes(String id) async {
    emit(AppointmentLoading());
    try {
      final availableTimes = await dataSource.getAvailability(id);
      emit(AppointmentLoaded(availableTimes: availableTimes));
    } catch (e) {
      emit(AppointmentError(message: e.toString()));
    }
  }

  Future<void> bookAppointment(BookAppointmentDto dto) async {
    try {
      final response = await dataSource.bookAppointment(dto);

      if (response.statusCode == 200) {
        print('Appointment booked successfully');
        final currentState = state;
        /*if (currentState is AppointmentLoaded) {
          emit(AppointmentLoaded(
            availableTimes: currentState.availableTimes, // Keep previous available times
          ));
        }*/
        emit(AppointmentBookedSuccessfully(message: 'Your appointment is currently pending and waiting for approval!'));
        // emit(...) if needed
      } else {
        emit(AppointmentError(message: 'Failed to book: ${response.body}'));
      }
    } catch (e) {
      emit(AppointmentError(message: e.toString()));
    }
  }

}
