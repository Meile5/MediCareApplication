import 'package:flutter/material.dart';
import 'package:medicare/doctor/common/doctor_navigator_manager.dart';
import 'package:medicare/doctor/overview/screens/doctor_overview_screen.dart';

class PatientInfoScreen extends StatefulWidget{
  const PatientInfoScreen({super.key});

  @override
  State<PatientInfoScreen> createState() => _PatientInfoScreenState();
}

class _PatientInfoScreenState extends State<PatientInfoScreen> {

  @override
  Widget build(BuildContext context) {
    return DoctorScaffold(

      child: Center(child: Text('Patient Info Screen')),
      //drawer: DoctorNavigationManager(),

    );
  }
}