import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final String serverUrl;
  late WebSocketChannel _channel;
  late StreamController<Map<String, dynamic>> _controller;

  WebSocketService(this.serverUrl) {
    _controller = StreamController<Map<String, dynamic>>.broadcast();
    _channel = WebSocketChannel.connect(Uri.parse(serverUrl));

    _channel.stream.listen((message) {
      final decodedMessage = jsonDecode(message);
      _controller.add(decodedMessage);
    }, onDone: () {
      print("WebSocket connection closed");
    }, onError: (error) {
      print("WebSocket error: $error");
    });
  }

  // Send message
  void sendMessage(String roomId, String userId, String message) {
    final msg = {
      "eventType": "ChatMessageDto", // Ensure this matches the server event type
      "RoomId": roomId,
      "UserId": userId,
      "Message": message,
    };
    _channel.sink.add(jsonEncode(msg));
  }

  // Listen for incoming messages
  Stream<Map<String, dynamic>> get messages => _controller.stream;

  // Close connection
  void closeConnection() {
    _channel.sink.close();
  }
}
