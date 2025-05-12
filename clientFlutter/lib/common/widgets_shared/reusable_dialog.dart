import 'package:flutter/material.dart';
class ReusableDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final Future<void> Function()? onConfirm;
  final VoidCallback? onCancel;

  const ReusableDialog({
    super.key,
    required this.title,
    required this.content,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        TextButton(
          onPressed: () {
            onCancel?.call();
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
            if (onConfirm != null) {
              await onConfirm!();
            }
            Navigator.pop(context);
          },
          child: const Text("Confirm"),
        ),
      ],
    );
  }
}
