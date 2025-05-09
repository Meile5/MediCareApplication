import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
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
    context.read<AppointmentCubit>().getPastAppointments();
  }

  final String animationEmpty = 'https://lottie.host/d6872b61-0888-460f-b77b-c99cfde00602/8sjSztLhTt.json';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PastAppointmentsLoaded) {
            if (state.pastAppointments.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Lottie animation
                    SizedBox(
                      height: 200,
                      child: Lottie.network(animationEmpty),
                    ),
                    const SizedBox(height: 20),
                    const Text('No past appointments'),
                  ],
                ),
              );
            }else{
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
            );}
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
