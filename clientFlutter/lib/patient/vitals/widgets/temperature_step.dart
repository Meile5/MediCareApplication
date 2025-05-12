import 'package:flutter/material.dart';

class TemperatureStep extends StatelessWidget {
  final double? temperature;
  final VoidCallback onConfirm;

  const TemperatureStep({required this.temperature, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step 1: Measure Your Temperature',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 16),
        Text(
          'Current temperature: ${temperature?.toStringAsFixed(1) ?? '...'}°C',
        ),
        Spacer(),
        ElevatedButton(
          onPressed: onConfirm,
          child: Text('Confirm Temperature'),
        ),
      ],
    );
  }
}
