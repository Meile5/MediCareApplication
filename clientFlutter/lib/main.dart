import 'package:flutter/material.dart';
import 'package:medicare/account/login/login_page.dart';

import 'patient/common/NavigationWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(),

    );

  }
}

