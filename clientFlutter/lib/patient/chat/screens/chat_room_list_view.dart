import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../common/chat/state/chat_cubit.dart';
import '../../../common/widgets_shared/message_display.dart';
import 'chat_room_screen.dart';

class ChatRoomListView extends StatelessWidget {
  final List<dynamic> chatRooms;
  final String userId;
  final String userName;

  const ChatRoomListView({
    super.key,
    required this.chatRooms,
    required this.userId,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime date) {
      final local = date.toLocal();
      final formattedDate = DateFormat.yMMMMd().format(local);
      final formattedTime = DateFormat('jm').format(local);
      return '$formattedDate,  $formattedTime';
    }

    if (chatRooms.isEmpty) {
      return const MessageDisplay(message: 'No chatrooms in this category');
    }

    return ListView.builder(
      itemCount: chatRooms.length,
      itemBuilder: (context, index) {
        final chat = chatRooms[index];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              title: Text(chat.topic),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (chat.isFinished)
                    Row(
                      children: [
                        Text('Ended: ', style: TextStyle(color: Colors.green)),

                        Text(
                          formatDate(chat.endTime),
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  if (!chat.isFinished &&
                      chat.startTime.isBefore(DateTime.now()))
                    const Text(
                      'In Progress',
                      style: TextStyle(color: Colors.orange),
                    ),
                  if (!chat.isFinished &&
                      chat.startTime.isAfter(DateTime.now()))
                    Row(
                      children: [
                        Text(
                          'Starts at: ',
                          style: TextStyle(color: Colors.blue),
                        ),

                        Text(
                          formatDate(chat.startTime),
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                ],
              ),
              trailing: FaIcon(Icons.chat, color: Colors.blueAccent),
              onTap: () {
                final now = DateTime.now();
                if (now.isBefore(chat.startTime)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'This chat room is not available yet. It starts at ${chat.startTime.toLocal()}',
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => BlocProvider.value(
                          value: context.read<ChatCubit>(),
                          child: ChatRoomScreen(
                            roomId: chat.id,
                            userId: userId,
                            userName: userName,
                            isFinished: chat.isFinished,
                          ),
                        ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
