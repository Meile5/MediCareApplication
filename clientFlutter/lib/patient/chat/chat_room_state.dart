import 'package:flutter/material.dart';

import 'chat_models.dart';

@immutable
sealed class ChatRoomState {}

final class ChatRoomInitial extends ChatRoomState {}

final class ChatRoomLoading extends ChatRoomState {}

final class ChatRoomLoaded extends ChatRoomState {
  final List<ChatRoomDto> chatRooms;
  ChatRoomLoaded({required this.chatRooms});
}

final class ChatRoomError extends ChatRoomState {
  final String message;
  ChatRoomError({required this.message});
}
