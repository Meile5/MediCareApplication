import 'package:flutter/material.dart';

Widget PatientInfoCard(IconData icon, String label, String label2) {
  return Card(
    elevation: 5.0,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
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
