import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/widgets.dart';
import '../../../../errorHandling/application_messages.dart';
import '../../../common/app_nav_bar.dart';
import '../../../overview/state/overview_cubit.dart';
import '../../../overview/state/overview_state.dart';
import '../../models/models_for_mapping.dart';
import '../state/doctors_cubit.dart';
import '../state/doctors_state.dart';
import '../widgets/doctor_info.dart';
import 'booking_calendar_screen.dart';


class ChooseDoctorScreen extends StatefulWidget {
  final String selectedReason;

  const ChooseDoctorScreen({
    super.key, required this.selectedReason,});

  @override
  State<ChooseDoctorScreen> createState() => _ChooseDoctorScreenState();
}

class _ChooseDoctorScreenState extends State<ChooseDoctorScreen> {
  ClinicDoctorDto? selectedDoctor;



  @override
  void initState() {

    super.initState();
    final clinicState = context.read<OverviewCubit>().state;

    if (clinicState is ClinicInfoLoaded) {
      final clinicId = clinicState.clinicInfo.firstWhere((clinic) => clinic.type == "Normal");
      context.read<DoctorsCubit>().retrieveDoctors(clinicId.id);
    } else if (clinicState is ClinicInfoError) {
      Center(child: Text(ApplicationMessages.generalError.message));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctors'), centerTitle: true,),
      body: BlocBuilder<DoctorsCubit, DoctorsState>(
        builder: (context, state) {
          if (state is DoctorsLoading) {
            return const Center(child: CircularProgressIndicator());
          }else if (state is DoctorsLoaded) {
            final doctors = state.doctors;

            return Column(
                children: [
                  Expanded(
                    child: DoctorInfo(
                      doctors: doctors,
                      selectedDoctor: selectedDoctor,
                      onDoctorSelected: (doctor) {
                        setState(() {
                          selectedDoctor = doctor;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedDoctor != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomBookingCalendar(selectedReason: widget.selectedReason, selectedDoctor: selectedDoctor!),

                            ));
                        // Navigate or process
                      } else {
                        context.showErrorSnackBar(message: "Please select doctor");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                    child: const Text("Next"),
                  ),
                  const SizedBox(height: 50),

                ]


            );
          }
          else if (state is DoctorsError) {
            return Center(child: Text('Error: ${state.message}'));
          }else {
            return const Center(child: Text('No appointments found.'));
          }


        }


    ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
