import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/account/login/login_page.dart';
import 'package:medicare/common/navigation_notifier.dart';
import 'package:medicare/common/websocket_service.dart';
import 'package:medicare/patient/appointmentManagement/appointments/state/appointment_cubit.dart';
import 'package:medicare/patient/appointmentManagement/booking/state/booking_cubit.dart';
import 'package:medicare/patient/appointmentManagement/booking/state/doctors_cubit.dart';
import 'package:medicare/patient/appointmentManagement/utils/data_source.dart';
import 'package:medicare/patient/chat/chat_cubit.dart';
import 'package:medicare/patient/chat/chat_data_source.dart';
import 'package:medicare/patient/overview/state/overview_cubit.dart';
import 'package:medicare/patient/overview/utility/data_source_overview.dart';
import 'package:medicare/patient/vitals/vitals_cubit.dart';

void main() {

//DateTimeMapper.encodingMode = DateTimeEncoding.iso8601String;

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
          create:
              (context) => BookingCubit(
                dataSource: DataSource(),
                webSocketService: webSocketService,
              ),
        ),
        BlocProvider(
          create: (context) => VitalsCubit(webSocketService: webSocketService),
        ),
        BlocProvider(
          create:
              (context) => ChatCubit(
                webSocketService: webSocketService,
                dataSource: ChatDataSource(),
              ),
        ),
        BlocProvider(
          create:
              (context) => OverviewCubit(
            dataSource: DataSourceOverview(),
          ),
        ),
        RepositoryProvider(create: (context) => NavigationModel()),
        BlocProvider(
          create:
              (context) => AppointmentCubit(
                webSocketService: webSocketService,
                dataSource: DataSource(),
              ),
        ),
        BlocProvider(
          create:
              (context) => DoctorsCubit(
            dataSource: DataSource(),
          ),
        ),
        RepositoryProvider(create: (context) => NavigationModel()),
      ],
      child: MaterialApp(title: 'Medicare', home: const LoginPage()),
    );
  }
}
