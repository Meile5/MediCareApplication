import 'package:flutter/material.dart';

import '../../../patient/overview/models/models_overview.dart';
import '../../../patient/overview/widgets/clinic_info.dart';
import '../../common/doctor_data_source.dart';

class ClinicInfoSection extends StatelessWidget {
  const ClinicInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClinicInfoDto>>(
      future: DoctorDataSource().retrieveClinicInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Error loading clinic info'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('No clinic information available.'),
          );
        }

        final clinics = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Clinic Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...clinics.map((clinic) => ClinicInfo(clinicInfo: clinic)).toList(),
          ],
        );
      },
    );
  }
}
