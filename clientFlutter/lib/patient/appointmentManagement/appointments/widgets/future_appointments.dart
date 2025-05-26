import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/auth/auth_prefs.dart';
import '../../../../common/widgets_shared/message_display.dart';
import '../../../../errorHandling/application_messages.dart';
import '../../../overview/state/overview_cubit.dart';
import '../../../overview/state/overview_state.dart';
import '../../booking/state/doctors_cubit.dart';
import '../../booking/state/doctors_state.dart';
import '../state/appointment_cubit.dart';
import '../state/appointment_state.dart';
import 'future_appointment_card.dart';

class FutureAppointments extends StatefulWidget {
  const FutureAppointments({super.key});

  @override
  State<FutureAppointments> createState() => _FutureAppointmentsState();
}

class _FutureAppointmentsState extends State<FutureAppointments> {
  @override
  void initState() {
    super.initState();

    final clinicState = context.read<OverviewCubit>().state;
    if (clinicState is ClinicInfoLoaded) {
      final clinic = clinicState.clinicInfo.firstWhere(
            (clinic) => clinic.type == "Normal",
      );
      context.read<DoctorsCubit>().retrieveDoctors(clinic.id);
    }

    context.read<AppointmentCubit>().getFutureAppointments();
  }




  @override
  Widget build(BuildContext context) {

    final doctorsState = context.watch<DoctorsCubit>().state;
    final appointmentState = context.watch<AppointmentCubit>().state;

    // Join rooms after build, only when both states are loaded
    if (doctorsState is DoctorsLoaded &&
        appointmentState is FutureAppointmentsLoaded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final doctorIds = doctorsState.doctors.map((doc) => doc.doctorId)
            .toSet();
        final appointments = appointmentState.futureAppointments;
        final userId = AuthPrefs.userId;

        for (final appt in appointments) {
          if (doctorIds.contains(appt.doctorId)) {
            final roomId = "${appt.doctorId}-$userId";
            print ('Joining room: $roomId');
            context.read<AppointmentCubit>().joinRoom(roomId);
          }
        }
      });
    }

    return SafeArea(
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FutureAppointmentsLoaded) {
            if (state.futureAppointments.isEmpty) {
              return MessageDisplay(message: 'No upcoming appointments');
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.futureAppointments.length,
                itemBuilder: (context, index) {
                  final appointment = state.futureAppointments[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: AppointmentCard(appointment: appointment),
                  );
                },
              );
            }
          } else if (state is AppointmentError) {
            return const MessageDisplay(
              message: 'Failed to load appointments.',
            );
          } else {
            return MessageDisplay(
              message: (ApplicationMessages.generalError.message),
            );
          }
        },
      ),
    );
  }
}
