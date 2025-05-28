import 'package:flutter/material.dart';

Widget vitalsCard(IconData icon, String label) {
  return Card(
    elevation: 5.0,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 50.0, color: Colors.blueAccent),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
