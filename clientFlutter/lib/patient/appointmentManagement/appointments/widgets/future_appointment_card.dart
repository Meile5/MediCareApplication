import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models_for_mapping.dart';
import 'package:intl/intl.dart';

import '../state/appointment_cubit.dart';

class AppointmentCard extends StatelessWidget {
  final FutureAppointmentsDto appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    Color getStatusColor(String status) {
      switch (status) {
        case 'Pending':
          return Colors.orange;
        case 'Approved':
          return Colors.green;
        case 'Rejected':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }
    String formatDate(DateTime date) {
      final local = date.toLocal();
      final formattedDate = DateFormat.yMMMMd().format(local);
      final formattedTime = DateFormat('jm').format(local);
      return 'Date: $formattedDate, Time: $formattedTime';
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(formatDate(appointment.startTime)),
              ],
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: getStatusColor(appointment.status),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    '${appointment.status}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: appointment.status == 'Rejected' ? null : () {
                final appointmentDto = CancelAppointmentDto(
                  id: appointment.id,
                  status: appointment.status,
                );
                context.read<AppointmentCubit>().cancelAppointment(appointmentDto);
              },
              child: const Text('Cancel'),
            ),
          ),

        ],
      ),
    );


  }
}
