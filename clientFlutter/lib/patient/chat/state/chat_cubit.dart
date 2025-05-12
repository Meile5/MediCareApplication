import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/events.dart';
import '../../../common/websocket_service.dart';
import '../utils/chat_data_source.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final WebSocketService webSocketService;
  final List<ChatMessage> _messages = [];
  final ChatDataSource dataSource;
  StreamSubscription? _subscription;

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
            final systemMsg = ChatMessage(
              roomId: event.roomId,
              userId: 'system',
              name: 'System',
              message: event.message,
            );
            _messages.add(systemMsg);
            emit(ChatLoaded(messages: List.unmodifiable(_messages)));
          }
        } catch (e) {
          emit(ChatError(message: 'Failed to process chat data: $e'));
        }
      },
      onError: (error) {
        emit(ChatError(message: 'WebSocket error: $error'));
      },
    );
  }

  void sendMessage(ChatMessage message) {
    webSocketService.send(message.toJson());
  }

  void joinRoom(String roomId) {
    webSocketService.send(JoinRoom(roomId: roomId).toJson());
  }

  Future<void> loadMessagesForRoom(String roomId) async {
    emit(ChatLoading());
    try {
      _messages.clear();
      final fetchedMessages = await dataSource.getMessagesForRoom(roomId);
      _messages.addAll(fetchedMessages);
      emit(ChatLoaded(messages: List.unmodifiable(_messages)));
    } catch (e) {
      emit(ChatError(message: 'Failed to load messages: $e'));
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
