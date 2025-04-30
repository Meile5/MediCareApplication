import 'package:flutter/material.dart';
import 'package:medicare/patient/common/app_nav_bar.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Text('Overview Screen', style: TextStyle(fontSize: 24)),
    ), bottomNavigationBar: AppNavBar());
  }
}