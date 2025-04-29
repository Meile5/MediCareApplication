import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/account/login/login_page.dart';
import 'package:medicare/patient/appointment/appointment_cubit.dart';
import 'package:medicare/patient/appointment/data_source.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


void main() {
  //final wsUri = Uri.parse('ws://localhost:8181');
  // final channel = WebSocketChannel.connect(wsUri);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.


  //small change
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentCubit(dataSource: DataSource(), channel: WebSocketChannel.connect(Uri.parse("ws://localhost:8181?id=user19"))),
      // Pass your data source here
      child: MaterialApp(
        title: 'Your App Name',

        home: LoginPage(),
      ),
    );
  }
}

