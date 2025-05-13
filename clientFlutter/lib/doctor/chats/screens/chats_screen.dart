import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/auth/auth_state.dart';
import 'package:medicare/doctor/common/doctor_cubit.dart';

import '../../../common/auth/auth_cubit.dart';
import '../../../common/chat/state/chat_room_state.dart';
import '../../../common/chat/utils/chat_data_source.dart';
import '../../../patient/chat/utils/chat_navigation.dart';
import 'doctor_chats_list_view.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late ChatDataSource _dataSource;
  ChatRoomState _state = ChatRoomInitial();

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthCubit>().state;
    if (authState is Authenticated) {
      _dataSource = ChatDataSource();
      _loadChatRooms();
    }
  }

  void _loadChatRooms() async {
    setState(() => _state = ChatRoomLoading());
    try {
      final chatRooms = await _dataSource.getChatRoomsForDoctor();
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
          return BlocBuilder<DoctorCubit, DoctorState>(
            builder: (context, doctorState) {
              if (doctorState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (doctorState.error != null) {
                return Center(child: Text('Error: ${doctorState.error}'));
              } else if (doctorState.doctor != null) {
                final doctor = doctorState.doctor!;

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
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 1000;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          child: Column(
                            children: [
                              const ChatNavigation(),
                              const SizedBox(height: 16),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    DoctorChatsListView(
                                      chatRooms: futureChatRooms,
                                      userId: doctor.doctorid,
                                      userName: doctor.name,
                                    ),
                                    DoctorChatsListView(
                                      chatRooms: pastChatRooms,
                                      userId: doctor.doctorid,
                                      userName: doctor.name,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              }
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
