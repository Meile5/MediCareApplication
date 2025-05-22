import 'package:flutter/material.dart';
import 'package:medicare/doctor/common/doctor_navigator_manager.dart';

import 'doctors_screen_header.dart';

class DoctorMainScreen extends StatelessWidget{
  const DoctorMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            DoctorsScreenHeader(),
            Expanded(
              child: DoctorNavigationManager(),
            ),
          ],
        )
      )

    );
  }
}