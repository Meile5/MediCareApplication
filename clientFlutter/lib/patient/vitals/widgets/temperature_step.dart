import 'package:flutter/material.dart';

class TemperatureStep extends StatelessWidget {
  final double? temperature;
  final VoidCallback onConfirm;

  const TemperatureStep({
    Key? key,
    required this.temperature,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Step 1: Measure Your Temperature',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Put the thermometer on your armpit as shown in the image below and wait until the temperature is stable',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Image.asset(
            'assets/temperature_guide.jpg', // Replace with your actual asset path
            height: 150,
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Current temperature: ${temperature?.toStringAsFixed(1) ?? '...'}°C',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Confirm Temperature'),
            ),
          ),
        ],
      ),
    );
  }
}
