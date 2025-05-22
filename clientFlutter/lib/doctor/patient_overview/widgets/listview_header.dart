import 'package:flutter/material.dart';

  Widget listViewHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
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
            "Name",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Text(
            "Surname",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Text(
            "Age",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Text(
            "Gender",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(width: 25),

        ],
      ),
    );
  }




