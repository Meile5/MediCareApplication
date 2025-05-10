import 'package:flutter/material.dart';

class EcgStep extends StatefulWidget {
  final List<int> ecgSamples;
  final VoidCallback onElectrodesReady;
  final VoidCallback onConfirm;

  const EcgStep({
    required this.ecgSamples,
    required this.onElectrodesReady,
    required this.onConfirm,
  });

  @override
  State<EcgStep> createState() => _EcgStepState();
}

class _EcgStepState extends State<EcgStep> {
  bool _electrodesReady = false;

  @override
  Widget build(BuildContext context) {
    final average =
        widget.ecgSamples.isNotEmpty
            ? (widget.ecgSamples.reduce((a, b) => a + b) /
                    widget.ecgSamples.length)
                .toStringAsFixed(2)
            : '...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Step 2: ECG Measurement', style: TextStyle(fontSize: 20)),
        SizedBox(height: 16),
        if (!_electrodesReady) ...[
          Text(
            'Please attach the ECG electrodes to your chest and arms as instructed.',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _electrodesReady = true;
              });
              widget.onElectrodesReady();
            },
            child: Text('Electrodes Ready'),
          ),
        ] else ...[
          Text('Collecting ECG data...'),
          SizedBox(height: 8),
          Text('Received ${widget.ecgSamples.length} ECG data points'),
          SizedBox(height: 8),
          Text('Average ECG value: $average'),
          Spacer(),
          ElevatedButton(
            onPressed: widget.onConfirm,
            child: Text('Confirm ECG'),
          ),
        ],
      ],
    );
  }
}
