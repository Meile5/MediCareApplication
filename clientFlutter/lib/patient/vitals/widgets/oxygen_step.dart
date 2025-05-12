import 'package:flutter/material.dart';

class OxygenStep extends StatelessWidget {
  final double oxygenLevel;
  final VoidCallback onConfirm;

  const OxygenStep({required this.oxygenLevel, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Step 3: Blood Oxygen Level', style: TextStyle(fontSize: 20)),
        SizedBox(height: 16),
        Text('Oxygen Level: $oxygenLevel% (mocked)'),
        Spacer(),
        ElevatedButton(
          onPressed: onConfirm,
          child: Text('Confirm Oxygen Level'),
        ),
      ],
    );
  }
}
