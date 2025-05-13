import 'package:flutter/material.dart';

class RightPanel extends StatelessWidget {
  final bool isFinished;
  final VoidCallback onFinishChatPressed;

  const RightPanel({
    super.key,
    required this.isFinished,
    required this.onFinishChatPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),

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
