import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/app_nav_bar.dart';
import 'chat_cubit.dart';
import 'chat_data_source.dart';
import 'chat_room_screen.dart';
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
      final chatRooms = await _dataSource.getChatRoomsForUser(
        'user-patient-001',
      );
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
            final message = (_state as ChatRoomError).message;
            return Center(child: Text('Error: $message'));
          } else if (_state is ChatRoomLoaded) {
            final chatRooms = (_state as ChatRoomLoaded).chatRooms;
            if (chatRooms.isEmpty) {
              return const Center(child: Text('No chat rooms found.'));
            }
            return ListView.builder(
              itemCount: chatRooms.length,
              itemBuilder: (context, index) {
                final chat = chatRooms[index];
                return ListTile(
                  title: Text(chat.topic),
                  subtitle: Text('Created at: ${chat.createdAt.toLocal()}'),
                  trailing: const Icon(Icons.chat_bubble_outline),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => BlocProvider.value(
                              value: context.read<ChatCubit>(),
                              child: ChatRoomScreen(
                                roomId: chat.id,
                                userId: 'user-patient-001',
                                userName: 'John',
                              ),
                            ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
