import 'package:flutter/material.dart';
import 'package:medicare/common/events.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatLoaded extends ChatState {
  final List<ChatMessage> messages;

  ChatLoaded({required this.messages});
}

final class ChatError extends ChatState {
  final String message;

  ChatError({required this.message});
}
