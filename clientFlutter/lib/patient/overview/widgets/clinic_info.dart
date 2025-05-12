import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/models_overview.dart';

class ClinicInfo extends StatelessWidget {
  final ClinicInfoDto clinicInfo;

  const ClinicInfo({super.key, required this.clinicInfo});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clinicInfo.type == "Normal"
                      ? "My clinic"
                      : "Out of hours clinic",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 2),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Text(clinicInfo.clinicname),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text("Working hours "),
                    Text(
                      clinicInfo.type == "Normal"
                          ? "8AM-4PM"
                          : "4PM-8AM",
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(clinicInfo.address),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.phone, size: 16, color: Colors.blueAccent), // wrap in Icon widget
                    SizedBox(width: 8),
                    Text(clinicInfo.phonenumber),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );


  }
}
