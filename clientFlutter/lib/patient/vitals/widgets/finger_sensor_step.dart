import 'dart:async';

import 'package:flutter/material.dart';

class FingerSensorStep extends StatefulWidget {
  final int? heartRate;
  final double? oxygenLevel;
  final ValueChanged<int> onHeartRateMeasured;
  final ValueChanged<double> onOxygenLevelMeasured;
  final VoidCallback onConfirm;

  const FingerSensorStep({
    Key? key,
    required this.heartRate,
    required this.oxygenLevel,
    required this.onHeartRateMeasured,
    required this.onOxygenLevelMeasured,
    required this.onConfirm,
  }) : super(key: key);

  @override
  State<FingerSensorStep> createState() => _FingerSensorStepState();
}

class _FingerSensorStepState extends State<FingerSensorStep> {
  bool _started = false;
  int _elapsed = 0;
  Timer? _timer;

  static const int _duration = 12;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startMeasurement() {
    setState(() {
      _started = true;
      _elapsed = 0;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsed++;
      });

      if (_elapsed >= _duration) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Step 3: Finger Sensor Measurement',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Image.asset('assets/finger_sensor.jpeg', height: 140),
          const SizedBox(height: 16),
          if (!_started) ...[
            Text(
              'Please place your finger on the sensor and wait at least 10 seconds.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _startMeasurement,
              child: Text('Start Measurement'),
            ),
          ] else ...[
            Text('Measuring... ($_elapsed / $_duration seconds)'),
            const SizedBox(height: 12),
            Text('Heart Rate: ${widget.heartRate?.toString() ?? 'N/A'} bpm'),
            Text(
              'Oxygen Level: ${widget.oxygenLevel != null ? widget.oxygenLevel!.toStringAsFixed(1) + ' %' : 'N/A'}',
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _elapsed >= _duration ? widget.onConfirm : null,
                child: Text('Confirm Readings'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
