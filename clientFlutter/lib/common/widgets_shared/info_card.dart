import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String? label;
  final String label2;

  const InfoCard({super.key,
    required this.icon,
    this.label,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3), // softer and lighter
            spreadRadius: 2,
            blurRadius: 10, // more blur for softness
            offset: const Offset(0, 4), // vertical drop shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// If there is a label, display it, if not don´t render
          if (label != null) ...[
            Text(
              label!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
          ],
          const SizedBox(height: 8),
          Icon(icon, size: 50.0, color: Colors.blueAccent),
          const SizedBox(height: 8),
          Text(
            label2,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),

        ],
      ),
    );
  }

}


