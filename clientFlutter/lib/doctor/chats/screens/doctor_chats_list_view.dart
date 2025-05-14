import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:medicare/doctor/chats/screens/doctor_chat_room_screen.dart';

import '../../../common/chat/state/chat_cubit.dart';

class DoctorChatsListView extends StatelessWidget {
  final List<dynamic> chatRooms;
  final String userId;
  final String userName;

  const DoctorChatsListView({
    super.key,
    required this.chatRooms,
    required this.userId,
    required this.userName,
  });

  String formatDate(DateTime date) {
    final local = date.toLocal();
    final formattedDate = DateFormat.yMMMMd().format(local);
    final formattedTime = DateFormat('jm').format(local);
    return '$formattedDate, $formattedTime';
  }

  @override
  Widget build(BuildContext context) {
    if (chatRooms.isEmpty) {
      return const Center(child: Text('No chat rooms in this category.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      itemCount: chatRooms.length,
      itemBuilder: (context, index) {
        final chat = chatRooms[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              final now = DateTime.now();
              if (now.isBefore(chat.startTime)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'This chat room is not available yet. It starts at ${formatDate(chat.startTime)}',
                    ),
                    duration: const Duration(seconds: 3),
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
                        child: DoctorChatRoomScreen(
                          roomId: chat.id,
                          userId: userId,
                          userName: userName,
                          patientId: chat.patientId,
                          isFinished: chat.isFinished,
                        ),
                      ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const FaIcon(Icons.chat, color: Colors.blueAccent),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat.topic,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 6),
                          if (chat.isFinished)
                            Text(
                              'Completed at: ${formatDate(chat.endTime)}',
                              style: const TextStyle(color: Colors.green),
                            ),
                          if (!chat.isFinished &&
                              chat.startTime.isBefore(DateTime.now()))
                            const Text(
                              'In Progress',
                              style: TextStyle(color: Colors.orange),
                            ),
                          if (!chat.isFinished &&
                              chat.startTime.isAfter(DateTime.now()))
                            Text(
                              'Starts at: ${formatDate(chat.startTime)}',
                              style: const TextStyle(color: Colors.blue),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
