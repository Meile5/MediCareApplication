import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/auth/auth_gate.dart';
import 'package:medicare/common/auth/auth_prefs.dart';
import 'package:medicare/common/navigation_notifier.dart';
import 'package:medicare/common/websocket_service.dart';
import 'package:medicare/patient/appointmentManagement/appointments/state/appointment_cubit.dart';
import 'package:medicare/patient/appointmentManagement/booking/state/booking_cubit.dart';
import 'package:medicare/patient/appointmentManagement/booking/state/doctors_cubit.dart';
import 'package:medicare/patient/appointmentManagement/utils/data_source.dart';
import 'package:medicare/patient/chat/state/chat_cubit.dart';
import 'package:medicare/patient/chat/utils/chat_data_source.dart';
import 'package:medicare/patient/common/patient_data_source.dart';
import 'package:medicare/patient/overview/state/overview_cubit.dart';
import 'package:medicare/patient/overview/utility/data_source_overview.dart';
import 'package:medicare/patient/vitals/state/vitals_cubit.dart';

import 'common/auth/auth_cubit.dart';
import 'patient/common/patient_cubit.dart';

void main() async {
  //DateTimeMapper.encodingMode = DateTimeEncoding.iso8601String;
  await AuthPrefs.init();
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
        BlocProvider(create: (context) => AuthCubit()..loadAuth()),
        BlocProvider(
          create: (context) => OverviewCubit(dataSource: DataSourceOverview()),
        ),
        BlocProvider(
          create:
              (_) => AppointmentCubit(
                dataSource: DataSource(),
                webSocketService: webSocketService,
              ),
        ),
        BlocProvider(
          create:
              (_) => BookingCubit(
                dataSource: DataSource(),
                webSocketService: webSocketService,
              ),
        ),
        BlocProvider(
          create: (_) => VitalsCubit(webSocketService: webSocketService),
        ),
        BlocProvider(
          create:
              (_) => ChatCubit(
                webSocketService: webSocketService,
                dataSource: ChatDataSource(),
              ),
        ),
        BlocProvider(
          create: (_) {
            final cubit = PatientCubit(dataSource: PatientDataSource());
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) => DoctorsCubit(dataSource: DataSource()),
        ),

        RepositoryProvider(create: (_) => NavigationModel()),
      ],
      child: const MaterialApp(title: 'Medicare', home: AuthGate()),
    );
  }
}
