import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/events.dart';

import 'chat_cubit.dart';
import 'chat_state.dart';

class ChatRoomScreen extends StatefulWidget {
  final String roomId;
  final String userId;
  final String userName;

  const ChatRoomScreen({
    super.key,
    required this.roomId,
    required this.userId,
    required this.userName,
  });

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ChatCubit>();
    cubit.clearMessages();
    cubit.joinRoom(widget.roomId);
    cubit.loadMessagesForRoom(widget.roomId);
  }

  void _sendMessage() {
    final messageText = _controller.text.trim();
    if (messageText.isEmpty) return;

    final message = ChatMessage(
      roomId: widget.roomId,
      userId: widget.userId,
      name: widget.userName,
      message: messageText,
    );

    context.read<ChatCubit>().sendMessage(message);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Room')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is ChatLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatError) {
                  return Center(child: Text(state.message));
                } else if (state is ChatLoaded) {
                  return ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final msg = state.messages[index];
                      final isOwn = msg.userId == widget.userId;
                      return ListTile(
                        title: Align(
                          alignment:
                              isOwn
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:
                                  isOwn ? Colors.blue[100] : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text('${msg.name}: ${msg.message}'),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
