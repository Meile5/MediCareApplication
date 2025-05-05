import 'package:flutter/material.dart';
import '../../models/models_for_mapping.dart';
import 'package:intl/intl.dart';

class PastAppointmentCard extends StatelessWidget {
  final PastAppointmentsDto appointment;

  const PastAppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {

    String formatDate(DateTime date) {
      final formattedDate = DateFormat.yMMMMd().format(date);
      final formattedTime = DateFormat('jm').format(date);
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

        ],
      ),
    );


  }
}
