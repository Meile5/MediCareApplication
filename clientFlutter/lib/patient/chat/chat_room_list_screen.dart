import 'package:flutter/material.dart';

import '../common/app_nav_bar.dart';
import 'chat_data_source.dart';
import 'chat_navigation.dart';
import 'chat_room_list_view.dart';
import 'chat_room_state.dart';

class ChatRoomListScreen extends StatefulWidget {
  const ChatRoomListScreen({super.key});

  @override
  State<ChatRoomListScreen> createState() => _ChatRoomListScreenState();
}

class _ChatRoomListScreenState extends State<ChatRoomListScreen> {
  final ChatDataSource _dataSource = ChatDataSource();
  ChatRoomState _state = ChatRoomInitial();

  @override
  void initState() {
    super.initState();
    _loadChatRooms();
  }

  void _loadChatRooms() async {
    setState(() => _state = ChatRoomLoading());
    try {
      final chatRooms = await _dataSource.getChatRoomsForUser('user123');
      setState(() => _state = ChatRoomLoaded(chatRooms: chatRooms));
    } catch (e) {
      setState(() => _state = ChatRoomError(message: e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Rooms'),
        automaticallyImplyLeading: false,
      ),
      body: Builder(
        builder: (context) {
          if (_state is ChatRoomLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (_state is ChatRoomError) {
            return Center(
              child: Text('Error: ${(_state as ChatRoomError).message}'),
            );
          } else if (_state is ChatRoomLoaded) {
            final chatRooms = (_state as ChatRoomLoaded).chatRooms;
            final pastChatRooms =
                chatRooms.where((chat) => chat.isFinished).toList();
            final futureChatRooms =
                chatRooms.where((chat) => !chat.isFinished).toList();

            return DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const ChatNavigation(),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ChatRoomListView(
                          chatRooms: futureChatRooms,
                          userId: 'user123',
                          userName: 'John',
                        ),
                        ChatRoomListView(
                          chatRooms: pastChatRooms,
                          userId: 'user123',
                          userName: 'John',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
