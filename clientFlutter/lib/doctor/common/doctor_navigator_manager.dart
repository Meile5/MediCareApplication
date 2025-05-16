import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/utility/navigation_notifier.dart';
import 'package:medicare/doctor/appointment/screens/appointments_screen.dart';
import 'package:medicare/doctor/chats/screens/chats_screen.dart';
import 'package:medicare/doctor/patient_overview/screens/clinic_patients_screen.dart';
import '../overview/screens/doctor_overview_screen.dart';
import 'doctor_side_navigation.dart';

class DoctorNavigationManager extends StatefulWidget {
  const DoctorNavigationManager({super.key});

  @override
  _DoctorNavigationManagerState createState() =>
      _DoctorNavigationManagerState();
}

class _DoctorNavigationManagerState extends State<DoctorNavigationManager> {
  final List<Widget> views = const [
    DoctorOverviewScreen(),
    ClinicPatients(),
    ChatsScreen(),
    AppointmentsScreen(),
  ];

  void _onNavigationItemSelected(BuildContext context, int index) {
    context.read<NavigationModel>().currentIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final navModel = context.read<NavigationModel>();

    return Scaffold(
      body: Row(
        children: [
          DoctorSideNavigation(
            selectedIndex: navModel.currentIndex.value,
            onItemSelected: (index) {
              _onNavigationItemSelected(context, index);
            },
          ),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: navModel.currentIndex,
              builder: (context, selectedIndex, _) {
                return views[selectedIndex];
              },
            ),
          ),
        ],
      ),
    );
  }
}
