import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/doctor/appointment/utils/doctor_appointment_data_source.dart';
import 'package:medicare/doctor/overview/screens/doctor_overview_screen.dart';

import '../state/doctor_appointment_cubit.dart';
import '../widgets/doctor_appointments_calendar.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DoctorScaffold(
      child: BlocProvider(
        create:
            (_) => DoctorAppointmentCubit(
              dataSource: DoctorAppointmentDataSource(),
            ),
        child: const DoctorAppointmentsCalendar(),
      ),
    );
  }
}
