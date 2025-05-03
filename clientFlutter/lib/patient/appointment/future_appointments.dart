import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AppointmentCard.dart';
import 'appointment_cubit.dart';
import 'appointment_state.dart';
import 'models_for_mapping.dart';

class FutureAppointments extends StatefulWidget {
  const FutureAppointments({super.key});

  @override
  State<FutureAppointments> createState() => _FutureAppointmentsState();
}

class _FutureAppointmentsState extends State<FutureAppointments> {
  @override
  void initState() {
    super.initState();
    final userId = "user123"; // Replace or pass from constructor
    context.read<AppointmentCubit>().getFutureAppointments(userId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FutureAppointmentsLoaded) {
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
