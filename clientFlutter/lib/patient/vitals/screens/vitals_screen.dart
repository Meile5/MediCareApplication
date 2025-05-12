import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/patient/vitals/screens/vitals_wizard_screen.dart';
import 'package:medicare/patient/vitals/state/vitals_cubit.dart';
import 'package:medicare/patient/vitals/widgets/vitals_card.dart';

import '../../../common/widgets_shared/info_card.dart';
import '../../common/app_nav_bar.dart';
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
      body: BlocBuilder<VitalsCubit, VitalsState>(
        builder: (context, state) {
          double? temperature;
          String temperatureStatus = 'Waiting for data...';
          Color temperatureColor = Colors.grey;
          bool isDataReady = state is VitalsUpdated;

          if (isDataReady) {
            temperature = (state as VitalsUpdated).temperature;
            temperatureStatus = '${temperature.toStringAsFixed(1)}°C';

            if (temperature > 37.5) {
              temperatureColor = Colors.red;
            } else if (temperature < 36.0) {
              temperatureColor = Colors.blue;
            } else {
              temperatureColor = Colors.green;
            }
          } else if (state is VitalsError) {
            temperatureStatus = 'Error: ${state.message}';
            temperatureColor = Colors.orange;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
                    temperatureCard(temperatureStatus, temperatureColor),
                    ecgCard(context),
                    InfoCard(icon: FontAwesomeIcons.heartbeat, label2: 'Heart Rate'),
                    InfoCard(icon: FontAwesomeIcons.lungs, label2: 'Blood Oxygen'),
                  ],
                ),

                const SizedBox(height: 64),

                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed:
                        isDataReady
                            ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //small change
                                  builder: (_) => VitalsWizardScreen(),
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
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
