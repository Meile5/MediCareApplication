import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/auth/auth_prefs.dart';
import 'package:medicare/errorHandling/application_messages.dart';

import '../../event_models/events.dart';
import '../../utility/websocket_service.dart';
import '../utils/chat_data_source.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final WebSocketService webSocketService;
  final List<ChatMessage> _messages = [];
  final ChatDataSource dataSource;
  StreamSubscription? _subscription;
  String? _currentRoomId;

  ChatCubit({required this.webSocketService, required this.dataSource})
    : super(ChatInitial()) {
    _subscription = webSocketService.stream.listen(
      (rawEvent) {
        try {
          final event = BaseEventMapper.fromJson(rawEvent);

          if (event is ChatMessage) {
            _messages.add(event);
            emit(ChatLoaded(messages: List.unmodifiable(_messages)));
          } else if (event is ServerMessage) {
            emit(ChatLoaded(messages: List.unmodifiable(_messages)));
          }
        } catch (e) {
          emit(
            ChatError(
              message: ApplicationMessages.failedToRetrieveData.message,
            ),
          );
        }
      },
      onError: (error) {
        emit(ChatError(message: ApplicationMessages.serverError.message));
      },
    );
  }

  void sendMessage(ChatMessage message) {
    webSocketService.send(message.toJson());
  }

  void joinRoom(String roomId) {
    if (_currentRoomId != null) {
      webSocketService.send(
        UnsubscribeFromChat(roomId: _currentRoomId!).toJson(),
      );
    }

    _currentRoomId = roomId;
    webSocketService.send(
      JoinRoom(roomId: roomId, token: AuthPrefs.jwt).toJson(),
    );
    print('Joined  Chat: $roomId');
  }

  void unsubscribeFromChat(String roomId) {
    webSocketService.send(UnsubscribeFromChat(roomId: roomId).toJson());
    _currentRoomId = null;
    print('Unsubscribed from Chat: $roomId');
  }

  Future<void> loadMessagesForRoom(String roomId) async {
    emit(ChatLoading());
    try {
      _messages.clear();
      final fetchedMessages = await dataSource.getMessagesForRoom(roomId);
      _messages.addAll(fetchedMessages);
      emit(ChatLoaded(messages: List.unmodifiable(_messages)));
    } catch (e) {
      emit(
        ChatError(message: ApplicationMessages.failedToRetrieveData.message),
      );
    }
  }

  void clearMessages() {
    _messages.clear();
    emit(ChatInitial());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
