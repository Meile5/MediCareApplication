import 'package:flutter/material.dart';
import 'package:medicare/doctor/common/doctor_navigator_manager.dart';

class PatientInfoScreen extends StatefulWidget{
  const PatientInfoScreen({super.key});

  @override
  State<PatientInfoScreen> createState() => _PatientInfoScreenState();
}

class _PatientInfoScreenState extends State<PatientInfoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Information'),
      ),
      body: const Center(),
      drawer: DoctorNavigationManager(),

    );
  }
}