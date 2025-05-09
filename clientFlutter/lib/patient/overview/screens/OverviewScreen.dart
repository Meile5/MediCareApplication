import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/patient/common/app_nav_bar.dart';
import 'package:medicare/patient/common/patient_cubit.dart';
import 'package:medicare/patient/overview/state/overview_cubit.dart';

import '../state/overview_state.dart';
import '../widgets/clinic_info.dart';
import '../widgets/patient_info_card.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OverviewCubit>().retrieveClinicInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<PatientCubit, PatientState>(
            builder: (context, patientState) {
              if (patientState.loading) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (patientState.patient != null) {
                final patient = patientState.patient!;
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello,',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            patient.name,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        children:  [
                          PatientInfoCard(
                              FontAwesomeIcons.droplet, 'My blood type', patient.bloodtype),
                          PatientInfoCard(
                            FontAwesomeIcons.personDotsFromLine,
                            'Allergies',
                            (patient.allergies != null && patient.allergies!.isNotEmpty)
                                ? patient.allergies!
                                : 'none',
                          ),

                        ],
                      ),
                    ),
                  ],
                );
              } else if (patientState.error != null) {
                return Center(child: Text('Error: ${patientState.error}'));
              } else {
                return const Center(child: Text('No patient data found.'));
              }
            },
          ),



          Expanded(
            child: BlocBuilder<OverviewCubit, OverviewState>(
              builder: (context, state) {
                if (state is ClinicInfoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ClinicInfoLoaded) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.clinicInfo.length,
                    itemBuilder: (context, index) {
                      final clinic = state.clinicInfo[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ClinicInfo(clinicInfo: clinic),
                      );
                    },
                  );
                } else if (state is ClinicInfoError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(child: Text('No appointments found.'));
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppNavBar(),
    );
  }
}
