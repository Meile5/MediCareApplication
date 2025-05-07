import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/patient/overview/OverviewScreen.dart';

import '../../common/widgets.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    context.read<LoginCubit>().login(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoggedIn) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => OverviewScreen()),
          );
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ListView(
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
              onPressed: state is LoginLoading ? null : _login,
              child:
                  state is LoginLoading
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
            ),
          ],
        );
      },
    );
  }
}
