//import 'package:chat/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/patient/overview/OverviewScreen.dart';

//import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets.dart';
import '../../patient/appointment/booking/state/booking_cubit.dart';
import '../../patient/common/app_nav_bar.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    /* context.read<LoginCubit>().login(
      email: _emailController.text,
      password: _passwordController.text,
    );*/
    context.read<BookingCubit>().loadAvailableTimes("user-doctor-1");

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => OverviewScreen()));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: formPadding,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          FormSpacer(),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          FormSpacer(),
          ElevatedButton(
            onPressed: /*state is LoginLoading ? null :*/ _login,
            child: const Text('Login'),
          ),
        ],
      ),
      // ),
    );
  }
}
