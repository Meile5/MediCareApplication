import 'package:flutter/material.dart';
import 'package:medicare/patient/common/patient_model.dart';

class RightPanel extends StatelessWidget {
  final bool isFinished;
  final VoidCallback onFinishChatPressed;
  final PatientDto? patient;
  const RightPanel({
    super.key,
    required this.isFinished,
    required this.onFinishChatPressed,
    required this.patient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (patient != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Patient Info',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text('Name: ${patient!.name}'),
                Text('Age: ${patient!.age}'),
              ],
            )
          else
            const Center(child: CircularProgressIndicator()),

          const Spacer(),

          if (!isFinished)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Finish Chat'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: onFinishChatPressed,
              ),
            )
          else
            const Text(
              'This chat has been finished.',
              style: TextStyle(color: Colors.grey),
            ),
        ],
      ),
    );
  }
}
