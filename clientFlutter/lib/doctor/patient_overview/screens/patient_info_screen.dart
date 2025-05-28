import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/doctor/overview/screens/doctor_overview_screen.dart';
import 'package:medicare/doctor/patient_overview/state/patients_vitals_cubit.dart';
import '../../../common/widgets_shared/diagnoses_info_card.dart';
import '../../../common/widgets_shared/info_card.dart';
import '../../../common/widgets_shared/message_display.dart';
import '../../../errorHandling/application_messages.dart';
import '../../../patient/common/patient_model.dart';
import '../models/patients_overview_models.dart';
import '../state/patients_diagnoses_cubit.dart';
import '../state/patients_diagnoses_state.dart';
import '../state/patients_vitals_state.dart';
import '../utils/charts_navigation.dart';
import '../widgets/patient_info_card.dart';
import 'analysis_screen.dart';


class PatientInfoScreen extends StatefulWidget {
  final PatientDto patient;

  const PatientInfoScreen({super.key, required this.patient});

  @override
  State<PatientInfoScreen> createState() => _PatientInfoScreenState();
}

class _PatientInfoScreenState extends State<PatientInfoScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PatientsVitalsCubit>().retrievePatientsVitals(
      widget.patient.userid,
    );
    context.read<DiagnosesCubit>().retrieveDiagnoses(widget.patient.userid);
  }

  PatientAnalysisRequest? _analysisRequest;

  @override
  Widget build(BuildContext context) {
    final vitalsState = context.watch<PatientsVitalsCubit>().state;
    final diagnosesState = context.watch<DiagnosesCubit>().state;

    if (vitalsState is PatientsVitalsLoaded &&
        diagnosesState is DiagnosesLoaded) {
      _analysisRequest = PatientAnalysisRequest(
        patient: widget.patient,
        vitals: vitalsState.vitals,
        diagnoses: diagnosesState.diagnoses,
      );
    } else {
      _analysisRequest = null;
    }
    return DoctorScaffold(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                children: [
                  Text(
                    "${widget.patient.name} ${widget.patient.surname}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  WebAnalysisScreen(request: _analysisRequest!),
                        ),
                      );
                    },
                    child: Text("Generate Analysis"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(flex: 1),
                Expanded(flex: 3, child: PatientInfo(patient: widget.patient)),
                const Spacer(flex: 1),
                Expanded(
                  flex: 3,
                  child: InfoCard(
                    icon: FontAwesomeIcons.droplet,
                    label: 'Blood type',
                    label2: widget.patient.bloodtype,
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 3,
                  child: InfoCard(
                    icon: FontAwesomeIcons.personDotsFromLine,
                    label: 'Allergies',
                    label2:
                        (widget.patient.allergies != null &&
                                widget.patient.allergies!.isNotEmpty)
                            ? widget.patient.allergies!
                            : 'none',
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(flex: 1),

                BlocBuilder<PatientsVitalsCubit, PatientsVitalsState>(
                  builder: (context, state) {
                    if (state is PatientsVitalsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PatientsVitalsLoaded) {
                      if (state.vitals.isEmpty) {
                        return const MessageDisplay(message: 'No vitals');
                      }

                      final vitalsData = state.vitals;
                      final temperatureDate = extractVitalData(
                        vitalsData,
                        (v) => v.bodyTemperature,
                      );
                      final heartRateDate = extractVitalData(
                        vitalsData,
                        (v) => v.heartRate?.toDouble(),
                      );
                      final oxygenLevelDate = extractVitalData(
                        vitalsData,
                        (v) => v.oxygenLevel?.toDouble(),
                      );

                      return Expanded(
                        flex: 5,
                        child: ChartsNavigation(
                          temperatureDate: temperatureDate,
                          heartRateDate: heartRateDate,
                          oxygenLevelDate: oxygenLevelDate,
                        ),
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
                const Spacer(flex: 1),
                BlocBuilder<DiagnosesCubit, DiagnosesState>(
                  builder: (context, state) {
                    if (state is DiagnosesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is DiagnosesLoaded) {
                      /* if (state.diagnoses.isEmpty) {
                          return const MessageDisplay(message: 'No diagnoses');
                        }*/
                      return Expanded(
                        flex: 4,
                        child: DiagnosesInfo(
                          diagnoses: state.diagnoses,
                          size: 0.55,
                          patientId: widget.patient.userid,
                        ),
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
                const Spacer(flex: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<MapEntry<DateTime, double>> extractVitalData(
    List<VitalsSignsDto> vitals,
    double? Function(VitalsSignsDto) valueSelector,
  ) {
    return vitals
        .where((v) => v.createdAt != null && valueSelector(v) != null)
        .map((v) => MapEntry(v.createdAt!, valueSelector(v)!))
        .toList()
      ..sort((a, b) => a.key.compareTo(b.key));
  }
}
