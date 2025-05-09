import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/patient/vitals/vitals_cubit.dart';

class EcgScreen extends StatelessWidget {
  const EcgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electrocardiogram ', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<VitalsCubit, VitalsState>(
        builder: (context, state) {
          List<int> ecgValues = [];

          if (state is VitalsUpdated && state.ecg != null) {
            ecgValues = state.ecg!;
          } else if (state is VitalsError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          if (ecgValues.isEmpty) {
            return const Center(child: Text('Waiting for ECG data...'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'ECG Waveform',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots:
                              ecgValues
                                  .asMap()
                                  .entries
                                  .map(
                                    (e) => FlSpot(
                                      e.key.toDouble(),
                                      e.value.toDouble(),
                                    ),
                                  )
                                  .toList(),
                          isCurved: false,
                          color: Colors.redAccent,
                          barWidth: 2,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                      titlesData: FlTitlesData(show: false),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: true),
                      minX: 0,
                      maxX: ecgValues.length.toDouble(),
                      minY:
                          ecgValues.reduce((a, b) => a < b ? a : b).toDouble() -
                          50,
                      maxY:
                          ecgValues.reduce((a, b) => a > b ? a : b).toDouble() +
                          50,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
