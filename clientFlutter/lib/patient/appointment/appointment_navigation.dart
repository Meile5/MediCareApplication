import 'package:flutter/material.dart';
import 'package:medicare/patient/appointment/past_appointments.dart';

import 'future_appointments.dart';

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
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: FutureAppointments()),
            Center(child: PastAppointments()),
          ],
        ),
      ),
    );
  }
}
