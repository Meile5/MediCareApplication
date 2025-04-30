import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/patient/vitals/vitals_cubit.dart';

class EcgScreen extends StatelessWidget {
  final double ecgValue;

  const EcgScreen({super.key, required this.ecgValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ECG Details', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<VitalsCubit, VitalsState>(
        builder: (context, state) {
          double? ecg;
          String ecgStatus = 'Waiting for data...';
          Color ecgColor = Colors.grey;

          if (state is VitalsUpdated) {
            ecg = state.ecg;
            if (ecg != null) {
              ecgStatus = '${ecg.toStringAsFixed(1)} ';

              // Example logic — adjust as needed for real ECG thresholds
              if (ecg > 1.5) {
                ecgColor = Colors.red;
              } else if (ecg < 0.5) {
                ecgColor = Colors.orange;
              } else {
                ecgColor = Colors.green;
              }
            } else {
              ecgStatus = 'No ECG data';
            }
          } else if (state is VitalsError) {
            ecgStatus = 'Error: ${state.message}';
            ecgColor = Colors.orange;
          }

          return Center(
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              margin: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.monitor_heart,
                      size: 60.0,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'ECG Value',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      ecgStatus,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ecgColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
