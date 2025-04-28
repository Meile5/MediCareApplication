import 'package:flutter/material.dart';
import 'package:medicare/patient/appointment/test.dart';

import 'Booking.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: //Text('Appointment Screen', style: TextStyle(fontSize: 24)),
      CustomBookingCalendar(),
    );
  }
}

