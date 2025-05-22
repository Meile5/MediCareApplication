import 'package:flutter/material.dart';

Widget temperatureCard(String value, Color color) {
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
        const Icon(
          Icons.thermostat_outlined,
          size: 50.0,
          color: Colors.blueAccent,
        ),
        const SizedBox(height: 10),
        const Text(
          'Temperature',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    ),
  );
}
