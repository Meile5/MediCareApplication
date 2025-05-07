import 'package:flutter/material.dart';
import 'package:medicare/patient/appointmentManagement/booking/screens/reason_for_appointment_screen.dart';
import 'package:medicare/patient/appointmentManagement/utils/booking_stepper.dart';
import '../../../common/app_nav_bar.dart';
import '../../booking/screens/booking_calendar_screen.dart';
import '../../utils/appointment_navigation.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => ReasonForAppointmentScreen(),
                    builder: (context) => BookingStepper(),

                  ),
                );
              },
            ),
          ),
          Expanded(
            child: AppointmentNavigation(),
          ),
        ],
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }

}

