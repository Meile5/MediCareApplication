import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/doctor/overview/screens/doctor_overview_screen.dart';
import 'package:medicare/doctor/patient_overview/screens/patient_info_screen.dart';

import '../../../../common/widgets_shared/message_display.dart';
import '../../../../errorHandling/application_messages.dart';
import '../../../patient/common/patient_model.dart';
import '../state/patients_cubit.dart';
import '../state/patients_state.dart';
import '../widgets/listview_header.dart';
import '../widgets/patient_card.dart';

class ClinicPatients extends StatefulWidget {
  const ClinicPatients({super.key});

  @override
  State<ClinicPatients> createState() => _ClinicPatientsState();
}

class _ClinicPatientsState extends State<ClinicPatients> {
  late TextEditingController _searchController;
  List<PatientDto> _allPatients = [];
  List<PatientDto> _filteredPatients = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
    context.read<PatientsCubit>().retrievePatients("sefdzgdrgdhfh");
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPatients =
          _allPatients
              .where(
                (patient) =>
                    patient.name.toLowerCase().contains(query) ||
                    patient.surname.toLowerCase().contains(query),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DoctorScaffold(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Clinic Patients',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: SearchBar(
                      controller: _searchController,
                      leading: const FaIcon(
                        FontAwesomeIcons.search,
                        color: Colors.blueAccent,
                      ),
                      hintText: "Search for patient",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                listViewHeader(context),
                Expanded(
                  child: BlocBuilder<PatientsCubit, PatientsState>(
                    builder: (context, state) {
                      if (state is PatientsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is PatientsLoaded) {
                        if (_allPatients.isEmpty) {
                          _allPatients = state.patients;
                          _filteredPatients = state.patients;
                        }

                        if (_filteredPatients.isEmpty) {
                          return MessageDisplay(message: 'No patients found');
                        } else {
                          return ListView.builder(
                            itemCount: _filteredPatients.length,
                            itemBuilder: (context, index) {
                              final patient = _filteredPatients[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: PatientInfoCard(
                                  label: patient.name,
                                  label2: patient.surname,
                                  label3: patient.age,
                                  label4: patient.gender,
                                  icon: IconButton(
                                    icon: const FaIcon(
                                      FontAwesomeIcons.ellipsis,
                                      color: Colors.blueAccent,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => PatientInfoScreen(
                                                patient: patient,
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      } else if (state is PatientsError) {
                        return const MessageDisplay(
                          message: 'Failed to load patients.',
                        );
                      } else {
                        return MessageDisplay(
                          message: (ApplicationMessages.generalError.message),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
