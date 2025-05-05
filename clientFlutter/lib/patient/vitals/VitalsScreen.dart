import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/patient/vitals/vitals_card.dart';
import 'package:medicare/patient/vitals/vitals_cubit.dart';

import '../common/app_nav_bar.dart';
import 'ecg_card.dart';
import 'temperature_card.dart';

class VitalsScreen extends StatelessWidget {
  const VitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vitals', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<VitalsCubit, VitalsState>(
        builder: (context, state) {
          double? temperature;
          double? ecg;
          String temperatureStatus = 'Waiting for data...';
          Color temperatureColor = Colors.grey;

          if (state is VitalsUpdated) {
            temperature = state.temperature;
            ecg = state.ecg;
            temperatureStatus = '${temperature.toStringAsFixed(1)}°C';

            if (temperature > 37.5) {
              temperatureColor = Colors.red;
            } else if (temperature < 36.0) {
              temperatureColor = Colors.blue;
            } else {
              temperatureColor = Colors.green;
            }
          } else if (state is VitalsError) {
            temperatureStatus = 'Error: ${state.message}';
            temperatureColor = Colors.orange;
            ecg = null;
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: [
                temperatureCard(temperatureStatus, temperatureColor),
                ecgCard(context, ecg),
                vitalsCard(FontAwesomeIcons.heartbeat, 'Heart Rate'),
                vitalsCard(FontAwesomeIcons.lungs, 'Blood Oxygen'),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
