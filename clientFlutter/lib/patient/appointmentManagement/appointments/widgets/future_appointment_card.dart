import 'package:flutter/material.dart';
import '../../models/models_for_mapping.dart';
import 'package:intl/intl.dart';

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
                // Handle cancel logic
              },
              child: const Text('Cancel'),
            ),
          ),

        ],
      ),
    );


  }
}
