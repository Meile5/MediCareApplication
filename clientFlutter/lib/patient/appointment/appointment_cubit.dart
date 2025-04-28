import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/events.dart';
import 'package:medicare/common/websocket_service.dart'; // <-- Import your service here

import 'appointment_state.dart';
import 'data_source.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final DataSource dataSource;
  final WebSocketService webSocketService;

  AppointmentCubit({required this.dataSource, required this.webSocketService})
    : super(AppointmentInitial()) {
    webSocketService.send(JoinRoom(roomId: "123").toJson());

    webSocketService.stream
        .map((rawEvent) => BaseEventMapper.fromJson(rawEvent))
        .listen((message) {
          if (message is ChatMessage) {
            print(message.message);
          }
        });
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
}
