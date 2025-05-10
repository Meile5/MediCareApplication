import 'package:flutter/material.dart';

Widget temperatureCard(String value, Color color) {
  return Card(
    elevation: 5.0,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    ),
  );
}
