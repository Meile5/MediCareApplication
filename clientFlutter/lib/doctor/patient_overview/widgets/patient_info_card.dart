import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../patient/common/patient_model.dart';

class PatientInfo extends StatelessWidget {
  final PatientDto patient;

  const PatientInfo({super.key,
    required this.patient});

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
                  "Patient info",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 2),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text("Age: "),
                    Text(
                      patient.age
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.phone, size: 16, color: Colors.blueAccent), // wrap in Icon widget
                    SizedBox(width: 8),
                    Text(patient.phonenumber),
                  ],
                ),
                const SizedBox(height: 2),
                Text(patient.address)
              ],
            ),
          ),

        ],
      ),
    );


  }
}
