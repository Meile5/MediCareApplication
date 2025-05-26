import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/common/utility/navigation_notifier.dart';
import 'package:side_navigation/side_navigation.dart';

import '../appointment/screens/appointments_screen.dart';
import '../chats/screens/chats_screen.dart';
import '../overview/screens/doctor_overview_screen.dart';
import '../patient_overview/screens/clinic_patients_screen.dart';

class DoctorSideNavigation extends StatelessWidget {
  final views = const [
    DoctorOverviewScreen.new,
    ClinicPatients.new,
    ChatsScreen.new,
    AppointmentsScreen.new,
  ];

  const DoctorSideNavigation({Key? key}) : super(key: key);

  void _onNavigationItemSelected(BuildContext context, int index) {
    context.read<NavigationModel>().currentIndex.value = index;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => views[index]()));
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: context.read<NavigationModel>().currentIndex,
      builder: (context, index, _) {
        return SideNavigationBar(
          selectedIndex: index,
          items: const [
            SideNavigationBarItem(
              icon: FontAwesomeIcons.houseMedical,
              label: 'Overview',
            ),
            SideNavigationBarItem(
              icon: FontAwesomeIcons.peopleLine,
              label: 'Patients',
            ),
            SideNavigationBarItem(
              icon: FontAwesomeIcons.message,
              label: 'Chats',
            ),
            SideNavigationBarItem(
              icon: FontAwesomeIcons.calendarDay,
              label: 'Appointments',
            ),
          ],
          onTap: (selected) {
            final adjustedIndex = selected;
            if (adjustedIndex >= 0 && adjustedIndex < views.length) {
              _onNavigationItemSelected(context, adjustedIndex);
            }
          },
          theme: SideNavigationBarTheme(
            dividerTheme: SideNavigationBarDividerTheme.standard(),
            togglerTheme: SideNavigationBarTogglerTheme.standard(),
            backgroundColor: Colors.white,
            itemTheme: SideNavigationBarItemTheme(
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.blueAccent,
              iconSize: 15.5,
              labelTextStyle: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
