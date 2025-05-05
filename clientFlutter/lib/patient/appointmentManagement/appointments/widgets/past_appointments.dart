import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/patient/appointmentManagement/appointments/widgets/past_appointment_card.dart';
import '../state/appointment_cubit.dart';
import '../state/appointment_state.dart';


class PastAppointments extends StatefulWidget {
  const PastAppointments({super.key});

  @override
  State<PastAppointments> createState() => _FutureAppointmentsState();
}

class _FutureAppointmentsState extends State<PastAppointments> {
  @override
  void initState() {
    super.initState();
    final userId = "user123"; // Replace or pass from constructor
    context.read<AppointmentCubit>().getPastAppointments(userId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PastAppointmentsLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.pastAppointments.length,
              itemBuilder: (context, index) {
                final appointment = state.pastAppointments[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PastAppointmentCard(appointment: appointment),
                );
              },
            );
          } else if (state is AppointmentError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No appointments found.'));
          }
        },
      ),
    );
  }



}
