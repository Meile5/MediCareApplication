import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/common/widgets_shared/widgets.dart';
import '../../../../common/widgets_shared/message_display.dart';
import '../../../../errorHandling/application_messages.dart';
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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FutureAppointmentsLoaded) {
            if (state.futureAppointments.isEmpty) {
              return MessageDisplay(message: 'No upcoming appointments');
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
            context.showErrorSnackBar(message: 'Error: ${state.message}');
            return const MessageDisplay(message: 'Failed to load appointments.');
          } else {
            return MessageDisplay(message: (ApplicationMessages.generalError.message));
          }
        },
      ),
    );
  }



}
