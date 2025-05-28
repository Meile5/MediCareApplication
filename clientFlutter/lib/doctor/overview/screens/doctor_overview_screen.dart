import 'package:flutter/material.dart';
import '../../common/doctor_side_navigation.dart';
import '../../doctors_screen_header.dart';
import '../widgets/clinic_info_section.dart';
import '../widgets/overview_main_content.dart';
import '../widgets/upcoming_appointments_list.dart';

class DoctorOverviewScreen extends StatelessWidget {
  const DoctorOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DoctorScaffold(
      child: Row(
        children: [
          Expanded(child: DoctorOverviewMainContent()),

          Container(
            width: 300,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border(left: BorderSide(color: Colors.grey.shade300)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClinicInfoSection(),
                Divider(thickness: 1),
                Text(
                  'Upcoming Appointments',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Expanded(child: UpcomingAppointmentsList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorScaffold extends StatelessWidget {
  final Widget child;
  const DoctorScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DoctorsScreenHeader(),
          Expanded(
            child: Row(
              children: [DoctorSideNavigation(), Expanded(child: child)],
            ),
          ),
        ],
      ),
    );
  }
}
