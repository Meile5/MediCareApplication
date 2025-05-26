import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:medicare/common/auth/auth_gate.dart';
import 'package:medicare/common/auth/auth_prefs.dart';
import 'package:medicare/common/chat/state/chat_cubit.dart';
import 'package:medicare/common/chat/utils/chat_data_source.dart';
import 'package:medicare/common/utility/navigation_notifier.dart';
import 'package:medicare/common/utility/websocket_service.dart';
import 'package:medicare/common/vitals/state/vitals_cubit.dart';
import 'package:medicare/doctor/appointment/utils/doctor_appointment_data_source.dart';
import 'package:medicare/doctor/patient_overview/state/patients_cubit.dart';
import 'package:medicare/patient/appointmentManagement/appointments/state/appointment_cubit.dart';
import 'package:medicare/patient/appointmentManagement/booking/state/booking_cubit.dart';
import 'package:medicare/patient/appointmentManagement/booking/state/doctors_cubit.dart';
import 'package:medicare/patient/appointmentManagement/utils/data_source.dart';
import 'package:medicare/patient/common/patient_data_source.dart';
import 'package:medicare/patient/overview/state/overview_cubit.dart';
import 'package:medicare/patient/overview/utility/data_source_overview.dart';
import 'package:uuid/uuid.dart';

import 'common/auth/auth_cubit.dart';
import 'common/utility/app_theme.dart';
import 'doctor/appointment/state/doctor_appointment_cubit.dart';
import 'doctor/common/clinic_cubit.dart';
import 'doctor/common/doctor_cubit.dart';
import 'doctor/common/doctor_data_source.dart';
import 'doctor/patient_overview/state/patients_diagnoses_cubit.dart';
import 'doctor/patient_overview/state/patients_vitals_cubit.dart';
import 'doctor/patient_overview/state/pdf_cubit.dart';
import 'doctor/patient_overview/utils/patients_overview_data_source.dart';
import 'patient/common/patient_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName:  ".env");
  await AuthPrefs.init();
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
    final _uuid = const Uuid();
    super.initState();
    webSocketService = WebSocketService("${dotenv.env['API_PRODUCTION_WEBSOCKETS']!}?id=${_uuid}");
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
          create:
              (_) => PatientsCubit(dataSource: PatientsOverviewDataSource()),
        ),
        BlocProvider(
          create: (_) {
            final cubit = PatientCubit(dataSource: PatientDataSource());
            return cubit;
          },
        ),
        BlocProvider(
          create: (_) {
            final cubit = DoctorCubit(dataSource: DoctorDataSource());
            return cubit;
          },
        ),
        BlocProvider(
          create: (_) {
            final cubit = ClinicInfoCubit(dataSource: DoctorDataSource());
            return cubit;
          },
        ),
        BlocProvider(
          create: (_) {
            final cubit = PatientsVitalsCubit(
              dataSource: PatientsOverviewDataSource(),
            );
            return cubit;
          },
        ),
        BlocProvider(
          create: (_) {
            final cubit = DiagnosesCubit(
              dataSource: PatientsOverviewDataSource(),
            );
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) => DoctorsCubit(dataSource: DataSource()),
        ),
        BlocProvider(
          create:
              (context) => DoctorAppointmentCubit(
                dataSource: DoctorAppointmentDataSource(),
                webSocketService: webSocketService,
              ),
        ),
        BlocProvider(
          create: (_) {
            final cubit = PdfCubit(dataSource: PatientsOverviewDataSource());
            return cubit;
          },
        ),

        RepositoryProvider(create: (_) => NavigationModel()),
      ],
      child: MaterialApp(
        title: 'Medicare',
        home: const AuthGate(),
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
