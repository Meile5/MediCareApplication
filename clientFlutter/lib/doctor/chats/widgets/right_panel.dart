import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/vitals/screens/ecg_screen.dart';
import 'package:medicare/common/vitals/state/vitals_cubit.dart';
import 'package:medicare/patient/common/patient_model.dart';

class RightPanel extends StatelessWidget {
  final bool isFinished;
  final VoidCallback onFinishChatPressed;
  final PatientDto? patient;

  const RightPanel({
    super.key,
    required this.isFinished,
    required this.onFinishChatPressed,
    required this.patient,
  });

  Color _getTemperatureColor(double temp) {
    if (temp > 37.5) return Colors.red;
    if (temp < 36.0) return Colors.blue;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (patient != null) ...[
            Text(
              'Patient Overview',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _infoRow(
                      Icons.person,
                      'Name',
                      '${patient!.name} ${patient!.surname}',
                    ),
                    _infoRow(Icons.cake, 'Age', patient!.age),
                    _infoRow(
                      Icons.water_drop,
                      'Blood Type',
                      patient!.bloodtype,
                    ),
                    _infoRow(Icons.wc, 'Gender', patient!.gender),
                    if (patient!.allergies != null &&
                        patient!.allergies!.isNotEmpty)
                      _infoRow(
                        Icons.warning_amber,
                        'Allergies',
                        patient!.allergies!,
                      ),
                    _infoRow(Icons.phone, 'Phone', patient!.phonenumber),
                    _infoRow(Icons.home, 'Address', patient!.address),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (patient!.deviceId == null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: const [
                    Icon(Icons.info_outline, color: Colors.orange),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Patient doesn't have a connected device.",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              BlocBuilder<VitalsCubit, VitalsState>(
                builder: (context, state) {
                  if (state is VitalsUpdated) {
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              'Live Vitals',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 12),
                            _vitalTile(
                              Icons.thermostat,
                              'Temperature',
                              '${state.temperature.toStringAsFixed(1)}°C',
                              color: _getTemperatureColor(state.temperature),
                            ),
                            _vitalTile(
                              Icons.favorite,
                              'Heart Rate',
                              '${state.heartRate?.toStringAsFixed(1)} BPM',
                              color: Colors.purple,
                            ),
                            _vitalTile(
                              Icons.air,
                              'Oxygen Saturation',
                              '${state.spo2?.toStringAsFixed(1)} %',

                              color: Colors.blueGrey,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (state is VitalsError) {
                    return Text(
                      'Vitals Error: ${state.message}',
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),

            const SizedBox(height: 16),
            if (patient!.deviceId != null) ...[
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.monitor_heart),
                label: const Text('View ECG'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => EcgScreen()),
                  );
                },
              ),
            ],
          ] else
            const Center(child: CircularProgressIndicator()),

          const Spacer(),

          if (!isFinished)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Finish Chat'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: onFinishChatPressed,
              ),
            )
          else
            const Text(
              'This chat has been finished.',
              style: TextStyle(color: Colors.grey),
            ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  Widget _vitalTile(
    IconData icon,
    String label,
    String value, {
    Color color = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w500)),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
