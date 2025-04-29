import 'package:flutter/material.dart';
class FutureAppointments extends StatelessWidget {
  const FutureAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Appointment 1"),
          SizedBox(height: 16),
          Text("Appointment 2"),
          // Add more items
        ],
      ),
    );
  }
}
