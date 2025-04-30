import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/patient/vitals/vitals_cubit.dart';

import 'ecg_screen.dart';

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
                _buildTemperatureCard(temperatureStatus, temperatureColor),
                _buildEcgCard(context, ecg),
                _buildVitalsCard(FontAwesomeIcons.heartbeat, 'Heart Rate'),
                _buildVitalsCard(FontAwesomeIcons.lungs, 'Blood Oxygen'),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTemperatureCard(String value, Color color) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.thermostat_outlined,
            size: 50.0,
            color: Colors.blueAccent,
          ),
          const SizedBox(height: 10),
          const Text(
            'Temperature',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEcgCard(BuildContext context, double? ecg) {
    final hasData = ecg != null;

    return Card(
      elevation: 5.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap:
            hasData
                ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EcgScreen(ecgValue: ecg!),
                    ),
                  );
                }
                : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              FontAwesomeIcons.heartbeat,
              size: 50.0,
              color: Colors.blueAccent,
            ),
            SizedBox(height: 10),
            Text(
              'ECG',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Tap to view ECG',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVitalsCard(IconData icon, String label) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          // Add action here if needed
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 50.0, color: Colors.blueAccent),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
