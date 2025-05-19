import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/patients_overview_models.dart';

class DiagnosesInfo extends StatelessWidget{
  final List<DiagnosesDto> diagnoses;

  const DiagnosesInfo(
      {super.key,
        required this.diagnoses,
      });
  String formatDate(DateTime? date) {
    if (date == null) return 'Invalid date';
    final formattedDate = DateFormat.yMMMMd().format(date);
    final formattedTime = DateFormat('jm').format(date);
    return '$formattedDate, $formattedTime';
  }

  @override

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
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

      child: Column(
        children: [
          Container(
            alignment: Alignment.center ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Diagnoses",
              style: TextStyle(fontSize: 18),

            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: diagnoses.length,
              itemBuilder: (context, index){
                final diagnoses = this.diagnoses[index];

                return Container(
                  margin: const EdgeInsets.all(10),
                  child: ExpansionTile(
                    title: Text(diagnoses.patientDiagnosis),
                    children: [
                      ListTile(
                        title: Text("Treatment", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        title: Text(diagnoses.treatment),
                      ),
                      ListTile(
                        title: Text("Diagnosed", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        title: Text(formatDate(diagnoses.date)),
                      ),

                ]
                  )

                );
              }

            ),
          ),
        ],
      ),
    );
  }

}