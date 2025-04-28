import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/events.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'appointment_state.dart';
import 'data_source.dart';


class AppointmentCubit extends Cubit<AppointmentState> {
  final DataSource dataSource;
  final WebSocketChannel channel;

  AppointmentCubit({required this.dataSource, required this.channel}) : super(AppointmentInitial())
  {
    channel.sink.add(JoinRoom(roomId: "123").toJson());
    channel.stream.map((rawEvent) => BaseEventMapper.fromJson(rawEvent)).listen((message) {
      switch (message.runtimeType) {
        case ChatMessage:
          final chatMessage = message as ChatMessage;
          print(message.message);
          break;
      }

    });
  }

  Future<void> loadAvailableTimes(String id) async {
    emit(AppointmentLoading());
    try {
      final availableTimes = await dataSource.getAvailability(id);


      emit(AppointmentLoaded(availableTimes: availableTimes
         ));
    } catch (e) {
      emit(AppointmentError(message: e.toString()));
    }
  }



}