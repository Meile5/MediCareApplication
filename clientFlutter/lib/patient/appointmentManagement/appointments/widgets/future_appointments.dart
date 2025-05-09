import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
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
    context.read<AppointmentCubit>().getFutureAppointments();
  }

  final String animationEmpty = 'https://lottie.host/d6872b61-0888-460f-b77b-c99cfde00602/8sjSztLhTt.json';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FutureAppointmentsLoaded) {
            if (state.futureAppointments.isEmpty) {
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
                    const Text('No upcoming appointments'),
                  ],
                ),
              );
            }else{
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
