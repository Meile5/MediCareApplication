import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/common/auth/auth_prefs.dart';
import 'package:medicare/common/chat/state/chat_state.dart';
import 'package:medicare/common/chat/utils/chat_data_source.dart';
import 'package:medicare/patient/common/patient_data_source.dart';
import 'package:medicare/patient/common/patient_model.dart';

import '../../../common/chat/state/chat_cubit.dart';
import '../../../common/event_models/events.dart';
import '../../../common/vitals/state/vitals_cubit.dart';
import '../../../common/widgets_shared/reusable_dialog.dart';
import '../widgets/right_panel.dart';

class DoctorChatRoomScreen extends StatefulWidget {
  final String roomId;
  final String userId;
  final String userName;
  final String patientId;
  final bool isFinished;

  const DoctorChatRoomScreen({
    super.key,
    required this.roomId,
    required this.userId,
    required this.userName,
    required this.patientId,
    required this.isFinished,
  });

  @override
  State<DoctorChatRoomScreen> createState() => _DoctorChatRoomScreenState();
}

class _DoctorChatRoomScreenState extends State<DoctorChatRoomScreen> {
  late PatientDataSource _patientDataSource;
  final TextEditingController _controller = TextEditingController();
  PatientDto? _patient;
  late VitalsCubit _vitalsCubit;
  late ChatCubit _chatCubit;

  @override
  void initState() {
    super.initState();
    _vitalsCubit = context.read<VitalsCubit>();
    _chatCubit = context.read<ChatCubit>();

    _chatCubit.clearMessages();
    _chatCubit.joinRoom(widget.roomId);
    _chatCubit.loadMessagesForRoom(widget.roomId);

    _patientDataSource = PatientDataSource();
    _loadPatient();
  }

  @override
  void dispose() {
    if (_patient?.deviceId != null) {
      _vitalsCubit.unsubscribeFromVitals(_patient!.deviceId!);
    }

    _chatCubit.unsubscribeFromChat(widget.roomId);

    _controller.dispose();
    super.dispose();
  }

  void _loadPatient() async {
    final patient = await _patientDataSource.getPatientById(widget.patientId);
    setState(() {
      _patient = patient;
    });

    if (mounted && patient.deviceId != null) {
      context.read<VitalsCubit>().subscribeToVitals(patient.deviceId!);
    }
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

    context.read<ChatCubit>().sendMessage(message);
    _controller.clear();
  }

  // Function to show the reusable confirmation dialog
  void _showFinishChatDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return ReusableDialog(
          title: 'Finish Chat',
          content: const Text('Are you sure you want to finish this chat?'),
          onConfirm: () async {
            try {
              await ChatDataSource().finishChat(widget.roomId);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Chat marked as finished.')),
              );
              Navigator.pop(context);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to finish chat: $e')),
              );
              Navigator.pop(context);
            }
          },
          onCancel: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Chat Room')),
      body: Row(
        children: [
          // Left: Chat Area (takes 2/3)
          Expanded(
            flex: 1,
            child: Column(
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
                          padding: const EdgeInsets.all(12),
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final msg = state.messages[index];
                            final isOwn = msg.userId == widget.userId;
                            return Align(
                              alignment:
                                  isOwn
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          enabled: !widget.isFinished,
                          decoration: InputDecoration(
                            hintText:
                                widget.isFinished
                                    ? 'Chat is finished'
                                    : 'Type a message...',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.paperPlane,
                          color:
                              widget.isFinished
                                  ? Colors.grey
                                  : Colors.blueAccent,
                        ),
                        onPressed: widget.isFinished ? null : _sendMessage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: RightPanel(
              isFinished: widget.isFinished,
              onFinishChatPressed: _showFinishChatDialog,
              patient: _patient,
            ),
          ),
        ],
      ),
    );
  }
}
