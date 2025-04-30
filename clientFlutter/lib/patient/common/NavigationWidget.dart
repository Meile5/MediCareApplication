import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../appointment/AppoinmentScreen.dart';
import '../chat/ChatScreen.dart';
import '../overview/OverviewScreen.dart';
import '../vitals/VitalsScreen.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = const [
    OverviewScreen(),
    AppointmentScreen(),
    ChatScreen(),
    VitalsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
