import 'dart:convert';

import 'package:http/http.dart' as http;

import 'chat_models.dart';

class ChatDataSource {
  Future<List<ChatRoomDto>> getChatRoomsForUser(String userId) async {
    final url = 'http://localhost:5000/chat/retreiveChats/patient';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"userId": userId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch chat rooms: ${response.statusCode}');
    }

    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((e) => ChatRoomDtoMapper.fromMap(e)).toList();
  }
}
