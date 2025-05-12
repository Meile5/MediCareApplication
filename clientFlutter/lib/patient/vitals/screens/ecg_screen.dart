import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/patient/vitals/state/vitals_cubit.dart';

class EcgScreen extends StatefulWidget {
  const EcgScreen({super.key});

  @override
  State<EcgScreen> createState() => _EcgScreenState();
}

class _EcgScreenState extends State<EcgScreen> {
  List<int> _buffer = [];
  static const int _maxBufferLength = 1000;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<VitalsCubit>();
    _subscription = cubit.stream.listen((state) {
      if (!mounted) return;
      if (state is VitalsUpdated &&
          state.ecg != null &&
          state.ecg!.isNotEmpty) {
        setState(() {
          _buffer.addAll(state.ecg!);
          if (_buffer.length > _maxBufferLength) {
            _buffer = _buffer.sublist(_buffer.length - _maxBufferLength);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electrocardiogram', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:
          _buffer.isEmpty
              ? const Center(child: Text('Waiting for ECG data...'))
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Live ECG Waveform',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots:
                                  _buffer
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
                          gridData: FlGridData(
                            show: true,
                            drawHorizontalLine: true,
                            horizontalInterval: 200,
                          ),
                          borderData: FlBorderData(show: true),
                          minX: 0,
                          maxX: _maxBufferLength.toDouble(),
                          minY:
                              _buffer
                                  .reduce((a, b) => a < b ? a : b)
                                  .toDouble() -
                              50,
                          maxY:
                              _buffer
                                  .reduce((a, b) => a > b ? a : b)
                                  .toDouble() +
                              50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
