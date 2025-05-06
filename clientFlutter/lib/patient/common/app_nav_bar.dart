import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/common/navigation_notifier.dart';

import '../appointmentManagement/appointments/screens/appointment_screen.dart';
import '../chat/chat_room_list_screen.dart';
import '../overview/OverviewScreen.dart';
import '../vitals/vitals_screen.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  final List<Widget> widgetOptions = const [
    OverviewScreen(),
    AppointmentScreen(),
    ChatRoomListScreen(),
    VitalsScreen(),
  ];

  void _onItemTapped(BuildContext context, int index) {
    context.read<NavigationModel>().currentIndex.value = index;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => widgetOptions[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final navModel = context.read<NavigationModel>();
    return ValueListenableBuilder(
      valueListenable: navModel.currentIndex,
      builder:
          (context, value, _) => BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.houseMedical),
                label: 'Overview',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.calendarDay),
                label: 'Appointments',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.userDoctor),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.heartPulse),
                label: 'Vitals',
              ),
            ],
            currentIndex: value,
            onTap: (index) => _onItemTapped(context, index),
          ),
    );
  }
}
