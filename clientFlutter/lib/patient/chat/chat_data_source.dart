import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../common/events.dart';
import 'chat_models.dart';

class ChatDataSource {
  final String jwt;
  final String patientId;
  ChatDataSource({required this.jwt, required this.patientId});
  Future<List<ChatRoomDto>> getChatRoomsForUser() async {
    final url = 'http://localhost:5000/chat/retreiveChats/patient';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json', 'Authorization': jwt},
      body: json.encode({"userId": patientId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch chat rooms: ${response.statusCode}');
    }

    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((e) => ChatRoomDtoMapper.fromMap(e)).toList();
  }

  Future<List<ChatMessage>> getMessagesForRoom(String roomId) async {
    final url = 'http://localhost:5000/chat/retreiveMessages';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json', 'Authorization': jwt},
      body: json.encode({"roomId": roomId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch messages: ${response.statusCode}');
    }

    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList
        .map(
          (e) => ChatMessage(
            roomId: e['roomId'],
            userId: e['senderId'],
            name: e['senderName'] ?? 'Unknown',
            message: e['content'],
          ),
        )
        .toList();
  }
}
