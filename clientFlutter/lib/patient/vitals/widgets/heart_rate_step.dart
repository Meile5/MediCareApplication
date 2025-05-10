import 'package:flutter/material.dart';

class HeartRateStep extends StatelessWidget {
  final int heartRate;
  final VoidCallback onConfirm;

  const HeartRateStep({required this.heartRate, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Step 4: Heart Rate', style: TextStyle(fontSize: 20)),
        SizedBox(height: 16),
        Text('Heart Rate: $heartRate bpm (mocked)'),
        Spacer(),
        ElevatedButton(onPressed: onConfirm, child: Text('Save Vitals')),
      ],
    );
  }
}
