import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/patient/common/app_nav_bar.dart';
import 'package:medicare/patient/common/patient_cubit.dart';
import 'package:medicare/patient/overview/state/overview_cubit.dart';

import '../../../common/widgets_shared/diagnoses_info_card.dart';
import '../../../common/widgets_shared/info_card.dart';
import '../../../common/widgets_shared/message_display.dart';
import '../../../doctor/patient_overview/state/patients_diagnoses_cubit.dart';
import '../../../doctor/patient_overview/state/patients_diagnoses_state.dart';
import '../../../doctor/patient_overview/state/patients_vitals_state.dart';
import '../../../errorHandling/application_messages.dart';
import '../state/overview_state.dart';
import '../widgets/clinic_info.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
                  context.read<DiagnosesCubit>().retrieveDiagnoses(
                    patient.userid,
                  );
                  return Column(
                    children: [
                      const SizedBox(height: 40),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hello,',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              patient.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          children: [
                            InfoCard(
                              icon: FontAwesomeIcons.droplet,
                              label: 'My blood type',
                              label2: patient.bloodtype,
                            ),
                            InfoCard(
                              icon: FontAwesomeIcons.personDotsFromLine,
                              label: 'Allergies',
                              label2:
                                  (patient.allergies != null &&
                                          patient.allergies!.isNotEmpty)
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

            BlocBuilder<OverviewCubit, OverviewState>(
              builder: (context, state) {
                if (state is ClinicInfoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ClinicInfoLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
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

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<DiagnosesCubit, DiagnosesState>(
                builder: (context, state) {
                  if (state is DiagnosesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DiagnosesLoaded) {
                    if (state.diagnoses.isEmpty) {
                      return const MessageDisplay(message: 'No diagnoses');
                    }
                    return DiagnosesInfo(
                      diagnoses: state.diagnoses,
                      showAddButton: false,
                      size: 0.2,
                    );
                  } else if (state is PatientsVitalsError) {
                    return const MessageDisplay(
                      message: 'Failed to load vitals.',
                    );
                  } else {
                    return MessageDisplay(
                      message: ApplicationMessages.generalError.message,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppNavBar(),
    );
  }
}
