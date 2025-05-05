import 'package:flutter/material.dart';

import '../appointments/widgets/future_appointments.dart';
import '../appointments/widgets/past_appointments.dart';
class AppointmentNavigation extends StatefulWidget {
  const AppointmentNavigation({super.key});

  @override
  State<AppointmentNavigation> createState() => _AppointmentNavigationState();
}

class _AppointmentNavigationState extends State<AppointmentNavigation> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.blueAccent.withAlpha(80),
            ),
            child: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black54,
              tabs: [
                Tab(text: 'Future'),
                Tab(text: 'Past'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                FutureAppointments(),
                PastAppointments(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
