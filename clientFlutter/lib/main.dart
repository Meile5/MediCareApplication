import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/account/login/login_page.dart';
import 'package:medicare/common/websocket_service.dart';
import 'package:medicare/patient/appointment/appointment_cubit.dart';
import 'package:medicare/patient/appointment/data_source.dart';
import 'package:medicare/patient/vitals/vitals_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final WebSocketService webSocketService;

  @override
  void initState() {
    super.initState();
    webSocketService = WebSocketService("ws://localhost:8181?id=user18");
  }

  @override
  void dispose() {
    webSocketService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AppointmentCubit(
            dataSource: DataSource(),
            webSocketService: webSocketService,
          ),
        ),
        BlocProvider(
          create: (context) => VitalsCubit(webSocketService: webSocketService),
        ),
      ],
      child: MaterialApp(title: 'Medicare', home: const LoginPage()),
    );
  }
}