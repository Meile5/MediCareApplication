import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/patient/common/app_nav_bar.dart';
import 'package:medicare/patient/common/patient_cubit.dart';
import 'package:medicare/patient/common/patient_model.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PatientCubit, PatientState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state.patient != null) {
            final PatientDto patient = state.patient!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text('Patient Overview'),
                  Text('Name: ${patient.name} ${patient.surname}'),
                  Text('Gender: ${patient.gender}'),
                  Text('Age: ${patient.age}'),
                  Text('Blood Type: ${patient.bloodtype}'),
                  Text('Allergies: ${patient.allergies ?? "None"}'),
                  Text('Phone Number: ${patient.phonenumber}'),
                  Text('Address: ${patient.address}'),
                  Text('Device ID: ${patient.deviceId ?? "None"}'),
                ],
              ),
            );
          }
          return const Center(child: Text('No patient data available'));
        },
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
