import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/common/auth/auth_prefs.dart';
import 'package:medicare/common/chat/state/chat_state.dart';

import '../../../common/chat/state/chat_cubit.dart';
import '../../../common/event_models/events.dart';

class ChatRoomScreen extends StatefulWidget {
  final String roomId;
  final String userId;
  final String userName;
  final bool isFinished;

  const ChatRoomScreen({
    super.key,
    required this.roomId,
    required this.userId,
    required this.userName,
    required this.isFinished,
  });

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _controller = TextEditingController();
  late ChatCubit _chatCubit; // <- Add this

  @override
  void initState() {
    super.initState();
    _chatCubit = context.read<ChatCubit>();

    _chatCubit.clearMessages();
    _chatCubit.joinRoom(widget.roomId);
    _chatCubit.loadMessagesForRoom(widget.roomId);
  }

  void _sendMessage() {
    if (widget.isFinished) return;

    final messageText = _controller.text.trim();
    if (messageText.isEmpty) return;

    final message = ChatMessage(
      roomId: widget.roomId,
      userId: widget.userId,
      name: widget.userName,
      message: messageText,
      token: AuthPrefs.jwt,
    );

    _chatCubit.sendMessage(message);
    _controller.clear();
  }

  @override
  void dispose() {
    _chatCubit.unsubscribeFromChat(widget.roomId);
    _controller.dispose();
    super.dispose();
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
                                  isOwn
                                      ? Colors.blueAccent[100]
                                      : Colors.grey[300],
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
                    decoration: InputDecoration(
                      hintText:
                          widget.isFinished
                              ? 'Chat is finished'
                              : 'Type a message...',
                      enabled: !widget.isFinished,
                    ),
                  ),
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.paperPlane,
                    color: Colors.blueAccent,
                  ),
                  onPressed: widget.isFinished ? null : _sendMessage,
                  color: widget.isFinished ? Colors.grey : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
