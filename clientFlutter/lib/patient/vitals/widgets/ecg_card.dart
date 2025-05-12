import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/ecg_screen.dart';

Widget ecgCard(BuildContext context, double? ecg) {
  final hasData = ecg != null;

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
    child: InkWell(
      onTap:
          hasData
              ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EcgScreen(ecgValue: ecg!)),
                );
              }
              : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            FontAwesomeIcons.heartbeat,
            size: 50.0,
            color: Colors.blueAccent,
          ),
          SizedBox(height: 10),
          Text(
            'ECG',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          Text(
            'Tap to view ECG',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
