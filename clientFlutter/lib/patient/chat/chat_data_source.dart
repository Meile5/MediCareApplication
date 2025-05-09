import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medicare/common/auth/auth_prefs.dart';

import '../../common/events.dart';
import 'chat_models.dart';

class ChatDataSource {
  Future<List<ChatRoomDto>> getChatRoomsForUser() async {
    final url = 'http://localhost:5000/chat/retreiveChats/patient';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!},
      body: json.encode({"userId": AuthPrefs.userId!}),
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
      headers: {'Content-Type': 'application/json', 'Authorization':  AuthPrefs.jwt!},
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
