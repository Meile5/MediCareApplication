import 'package:flutter/material.dart';

class PatientInfoCard extends StatelessWidget {
  final String label;
  final String label2;
  final String label3;
  final String label4;
  final IconButton icon;

  const PatientInfoCard({
    super.key,
    required this.label,
    required this.label2,
    required this.label3,
    required this.label4,
    required this.icon,
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
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            label2,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            label3,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            label4,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          icon,
        ],
      ),
    );
  }
}
