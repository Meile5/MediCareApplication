import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../patient/overview/widgets/clinic_info.dart';
import '../../common/clinic_cubit.dart'; // Make sure this import is correct

class ClinicInfoSection extends StatelessWidget {
  const ClinicInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger the loading of clinic info when this widget is built
    context.read<ClinicInfoCubit>().loadClinicInfo();

    return BlocBuilder<ClinicInfoCubit, ClinicInfoState>(
      builder: (context, state) {
        if (state.loading) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state.error != null) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Error loading clinic info'),
          );
        } else if (state.clinics == null || state.clinics!.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('No clinic information available.'),
          );
        }

        final clinics = state.clinics!;
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
