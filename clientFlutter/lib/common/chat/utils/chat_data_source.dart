import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:medicare/common/auth/auth_prefs.dart';

import '../../event_models/events.dart';
import '../models/chat_models.dart';

class ChatDataSource {
  Future<List<ChatRoomDto>> getChatRoomsForUser() async {
    final url =
        "${dotenv.env['API_BASE_URL']!}/chat/retreiveChats/patient?userId=${AuthPrefs.userId}";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
    );

    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((e) => ChatRoomDtoMapper.fromMap(e)).toList();
  }

  Future<List<ChatRoomDto>> getChatRoomsForDoctor() async {
    final url =
        "${dotenv.env['API_BASE_URL']!}/chat/retreiveChats/doctor?userId=${AuthPrefs.userId}";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
    );

    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((e) => ChatRoomDtoMapper.fromMap(e)).toList();
  }

  Future<List<ChatMessage>> getMessagesForRoom(String roomId) async {
    final url =
        "${dotenv.env['API_BASE_URL']!}/chat/retreiveMessages?roomId=$roomId";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
    );

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

  Future<void> finishChat(String roomId) async {
    final url = "${dotenv.env['API_BASE_URL']!}/chat/finish?roomId=$roomId";

    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to finish chat: ${response.body}');
    }
  }
}
