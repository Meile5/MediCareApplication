import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/common/vitals/state/vitals_cubit.dart';
import 'package:medicare/patient/vitals/screens/pair_screen.dart';
import 'package:medicare/patient/vitals/screens/vitals_wizard_screen.dart';

import '../../../common/widgets_shared/info_card.dart';
import '../../common/app_nav_bar.dart';
import '../../common/patient_cubit.dart';
import '../../common/patient_state.dart';
import '../widgets/ecg_card.dart';
import '../widgets/temperature_card.dart';

class VitalsScreen extends StatelessWidget {
  const VitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Vitals'),
        automaticallyImplyLeading: false,
      ),
      body: Builder(
        builder: (context) {
          return BlocBuilder<PatientCubit, PatientState>(
            builder: (context, patientState) {
              if (patientState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (patientState.error != null) {
                return Center(child: Text('Error: ${patientState.error}'));
              } else if (patientState.patient != null) {
                final patient = patientState.patient!;
                final deviceId = patient.deviceId;

                if (deviceId == null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.device_unknown,
                          size: 60,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Please pair your device',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to device pairing screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => PairScreen()),
                            );
                          },
                          child: const Text('Pair Device'),
                        ),
                      ],
                    ),
                  );
                }

                context.read<VitalsCubit>().subscribeToVitals(deviceId);

                return BlocBuilder<VitalsCubit, VitalsState>(
                  builder: (context, state) {
                    double? temperature;
                    String temperatureStatus = 'Waiting for data...';
                    Color temperatureColor = Colors.grey;
                    int? heartRate;
                    int? spo2;
                    String heartRateLabel = 'Waiting...';
                    String spo2Label = 'Waiting...';
                    bool isDataReady = state is VitalsUpdated;

                    if (isDataReady) {
                      final vitals = state as VitalsUpdated;
                      temperature = vitals.temperature;
                      heartRate = vitals.heartRate;
                      spo2 = vitals.spo2;
                      //temperature = (state as VitalsUpdated).temperature;
                      temperatureStatus = '${temperature.toStringAsFixed(1)}°C';

                      if (temperature > 37.5) {
                        temperatureColor = Colors.red;
                      } else if (temperature < 36.0) {
                        temperatureColor = Colors.blue;
                      } else {
                        temperatureColor = Colors.green;
                      }
                      heartRateLabel =
                          heartRate != null ? '$heartRate bpm' : 'No finger';
                      spo2Label = spo2 != null ? '$spo2%' : 'No finger';
                    } else if (state is VitalsError) {
                      temperatureStatus = 'Error: ${state.message}';
                      temperatureColor = Colors.orange;
                      heartRateLabel = 'Error';
                      spo2Label = 'Error';
                    }

                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Grid
                          GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            children: [
                              temperatureCard(
                                temperatureStatus,
                                temperatureColor,
                              ),
                              ecgCard(context),
                              InfoCard(
                                icon: FontAwesomeIcons.heartbeat,
                                label: heartRateLabel,
                                label2: 'Heart Rate',
                              ),
                              InfoCard(
                                icon: FontAwesomeIcons.lungs,
                                label: spo2Label,
                                label2: 'Blood Oxygen',
                              ),
                            ],
                          ),

                          const SizedBox(height: 64),

                          // Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              onPressed:
                                  isDataReady
                                      ? () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (_) => VitalsWizardScreen(),
                                          ),
                                        );
                                      }
                                      : null,
                              child: const Text('Take Your Daily Vitals Check'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          );
        },
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
