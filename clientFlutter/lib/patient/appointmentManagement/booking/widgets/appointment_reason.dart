import 'package:flutter/material.dart';

class AppointmentReason extends StatelessWidget {
  final List<String> reasons;
  final String? selectedReason;
  final void Function(String) onReasonSelected;

  const AppointmentReason({
    super.key,
    required this.reasons,
    required this.selectedReason,
    required this.onReasonSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16),
        children: reasons.map((reason) {
          final isSelected = selectedReason == reason;

          return GestureDetector(
            onTap: () => onReasonSelected(reason),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blueAccent : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(50),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Text(
                reason,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ),

          );
        }).toList(),
      );

  }
}
