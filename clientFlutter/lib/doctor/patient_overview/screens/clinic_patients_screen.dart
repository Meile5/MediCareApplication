import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/doctor/overview/screens/doctor_overview_screen.dart';
import 'package:medicare/doctor/patient_overview/screens/patient_info_screen.dart';
import '../../../../common/widgets_shared/message_display.dart';
import '../../../../errorHandling/application_messages.dart';
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
  @override
  void initState() {
    super.initState();
    context.read<PatientsCubit>().retrievePatients("97y88098i0jnjb");
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
                      style: TextStyle(
                         fontSize: 20,))
                  ),
                  const SizedBox(height: 20 ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: SearchBar(
                        leading: FaIcon(FontAwesomeIcons.searchengin, color: Colors.blueAccent),
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
                          if (state.patients.isEmpty) {
                            return MessageDisplay(message: 'No patients');
                          }else{
                            return ListView.builder(
                              itemCount: state.patients.length,
                              itemBuilder: (context, index) {
                                final patient = state.patients[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: PatientInfoCard(
                                    label: patient.name,
                                    label2: patient.surname,
                                    label3: patient.age,
                                    label4: patient.gender,
                                    icon: IconButton(
                                      icon: FaIcon(FontAwesomeIcons.ellipsis, color: Colors.blueAccent),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PatientInfoScreen(),
      
                                          ),
                                        );                                    },
                                    )
      
                                  )
                                );
                              },
                            );}
                        } else if (state is PatientsError) {
                          return const MessageDisplay(message: 'Failed to load patients.');
                        } else {
                          return MessageDisplay(message: (ApplicationMessages.generalError.message));
                        }
                      },
                    ),
                  )
                    ],
        
        
              ),
            )),
      ),
    );
  }



}
