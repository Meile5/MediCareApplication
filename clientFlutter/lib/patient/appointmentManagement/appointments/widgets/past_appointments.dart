import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/common/widgets_shared/widgets.dart';
import 'package:medicare/patient/appointmentManagement/appointments/widgets/past_appointment_card.dart';
import '../../../../common/widgets_shared/message_display.dart';
import '../../../../errorHandling/application_messages.dart';
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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppointmentCubit, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PastAppointmentsLoaded) {
            if (state.pastAppointments.isEmpty) {
              return MessageDisplay(message: 'No past appointments');
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
