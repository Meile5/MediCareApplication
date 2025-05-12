import 'dart:async';

import 'package:flutter/material.dart';

class EcgStep extends StatefulWidget {
  final List<int> ecgSamples;
  final VoidCallback onElectrodesReady;
  final VoidCallback onConfirm;

  const EcgStep({
    Key? key,
    required this.ecgSamples,
    required this.onElectrodesReady,
    required this.onConfirm,
  }) : super(key: key);

  @override
  State<EcgStep> createState() => _EcgStepState();
}

class _EcgStepState extends State<EcgStep> {
  bool _electrodesReady = false;
  int _elapsedSeconds = 0;
  Timer? _timer;

  static const int _targetSeconds = 10;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startEcgTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
      if (_elapsedSeconds >= _targetSeconds) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final average =
        widget.ecgSamples.isNotEmpty
            ? (widget.ecgSamples.reduce((a, b) => a + b) /
                    widget.ecgSamples.length)
                .toStringAsFixed(2)
            : '...';

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Step 2: ECG Measurement',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 24),
          Image.asset('assets/electrode_guide.jpg', height: 120),
          const SizedBox(height: 24),
          if (!_electrodesReady) ...[
            Text(
              'Please attach the ECG electrodes to your chest and arms as shown.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _electrodesReady = true;
                  _startEcgTimer();
                });
                widget.onElectrodesReady();
              },
              child: Text('Electrodes Ready'),
            ),
          ] else ...[
            Text('Collecting ECG data...', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text('Elapsed time: $_elapsedSeconds s / $_targetSeconds s'),
            const SizedBox(height: 12),
            Text('Received: ${widget.ecgSamples.length} samples'),
            Text('Average value: $average'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    _elapsedSeconds >= _targetSeconds ? widget.onConfirm : null,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Confirm ECG'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
