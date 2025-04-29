import 'package:flutter/material.dart';
import 'package:medicare/patient/appointment/appointment_navigation.dart';
import 'package:medicare/patient/appointment/booking_calendar.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CustomBookingCalendar(),
                  ));
            },
            child: Text('Goto Next Page')),

        AppointmentNavigation(),
      ]




    );
  }
}

