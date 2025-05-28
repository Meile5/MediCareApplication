import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../common/widgets_shared/message_display.dart';
import '../../appointment/state/doctor_appointment_cubit.dart';
import '../../appointment/state/doctor_appointment_state.dart';

class UpcomingAppointmentsList extends StatefulWidget {
  const UpcomingAppointmentsList({super.key});

  @override
  State<UpcomingAppointmentsList> createState() =>
      _UpcomingAppointmentsListState();
}

class _UpcomingAppointmentsListState extends State<UpcomingAppointmentsList> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorAppointmentCubit>().getDoctorAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAppointmentCubit, DoctorAppointmentState>(
      builder: (context, state) {
        if (state is DoctorAppointmentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DoctorAppointmentLoaded) {
          final now = DateTime.now();
          final today = DateTime(now.year, now.month, now.day);

          final todayAppointments =
              state.appointments.where((appt) {
                  final now = DateTime.now();
                  final localStart = appt.startTime.toLocal();

                  final isToday =
                      localStart.year == now.year &&
                      localStart.month == now.month &&
                      localStart.day == now.day;

                  final isInFuture = localStart.isAfter(now);

                  return isToday && isInFuture;
                }).toList()
                ..sort((a, b) => a.startTime.compareTo(b.startTime));

          if (todayAppointments.isEmpty) {
            return const MessageDisplay(
              message: 'No appointments for the rest of the day',
            );
          }

          return ListView.builder(
            itemCount: todayAppointments.length,
            itemBuilder: (context, index) {
              final appt = todayAppointments[index];
              return ListTile(
                title: Text(appt.notes ?? 'No reason'),
                subtitle: Text(
                  DateFormat.jm().format(appt.startTime.toLocal()),
                ),
                trailing: Text(
                  appt.status ?? 'Pending',
                  style: TextStyle(
                    color: _statusColor(appt.status),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        } else if (state is DoctorAppointmentError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Color _statusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
