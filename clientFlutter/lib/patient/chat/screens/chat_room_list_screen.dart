import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/auth/auth_state.dart';
import 'package:medicare/patient/common/patient_cubit.dart';
import '../../../common/auth/auth_cubit.dart';
import '../../../common/chat/state/chat_room_state.dart';
import '../../../common/chat/utils/chat_data_source.dart';
import '../../common/app_nav_bar.dart';
import '../../common/patient_state.dart';
import '../utils/chat_navigation.dart';
import 'chat_room_list_view.dart';

class ChatRoomListScreen extends StatefulWidget {
  const ChatRoomListScreen({super.key});

  @override
  State<ChatRoomListScreen> createState() => _ChatRoomListScreenState();
}

class _ChatRoomListScreenState extends State<ChatRoomListScreen> {
  late ChatDataSource _dataSource;
  ChatRoomState _state = ChatRoomInitial();

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthCubit>().state;
    if (authState is Authenticated) {
      _dataSource = ChatDataSource();
      _loadChatRooms();
    } else {}
  }

  void _loadChatRooms() async {
    setState(() => _state = ChatRoomLoading());
    try {
      final chatRooms = await _dataSource.getChatRoomsForUser();
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
          return BlocBuilder<PatientCubit, PatientState>(
            builder: (context, patientState) {
              if (patientState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (patientState.error != null) {
                return Center(child: Text('Error: ${patientState.error}'));
              } else if (patientState.patient != null) {
                final patient = patientState.patient!;

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
                        const ChatNavigation(width: 325),
                        Expanded(
                          child: TabBarView(
                            children: [
                              ChatRoomListView(
                                chatRooms: futureChatRooms,
                                userId: patient.userid,
                                userName: patient.name,
                              ),
                              ChatRoomListView(
                                chatRooms: pastChatRooms,
                                userId: patient.userid,
                                userName: patient.name,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
              return const SizedBox.shrink();
            },
          );
        },
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
