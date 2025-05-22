import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/utility/navigation_notifier.dart';

import 'doctor_side_navigation.dart';

class DoctorNavigationManager extends StatefulWidget {
  const DoctorNavigationManager({super.key});

  @override
  _DoctorNavigationManagerState createState() =>
      _DoctorNavigationManagerState();
}

class _DoctorNavigationManagerState extends State<DoctorNavigationManager> {


  @override
  Widget build(BuildContext context) {
    final navModel = context.read<NavigationModel>();

    return Scaffold(
      body: Row(
        children: [
          DoctorSideNavigation(),
          Expanded(
            child: Placeholder()
          ),
        ],
      ),
    );
  }
}
