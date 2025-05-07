import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            color: Colors.grey.withOpacity(0.2),
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
                Text(clinicInfo.clinicname),
                Text(clinicInfo.address),
                Text(clinicInfo.phonenumber),
                Text(clinicInfo.type),
              ],
            ),
          ),
          const SizedBox(width: 18),

        ],
      ),
    );


  }
}
