import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/utility/navigation_notifier.dart';
import '../../common/doctor_side_navigation.dart';
import '../../doctors_screen_header.dart';

class DoctorOverviewScreen extends StatelessWidget {
  const DoctorOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DoctorScaffold(child: Center(child: Text('Overview Screen')),);
  }
}

class DoctorScaffold extends StatelessWidget {
  final Widget child;
  const DoctorScaffold({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            DoctorsScreenHeader(),
            Expanded(
              child: Row(
                children: [
                  DoctorSideNavigation(),
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
