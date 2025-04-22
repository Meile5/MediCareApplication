import 'package:flutter/material.dart';

import 'login_cubit.dart';
import 'login_form.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: LoginForm(),
    );
   /* return BlocProvider(
      create: (context) => LoginCubit(context.read<ChatService>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoggedIn) {
            Navigator.of(
              context,
            ).pushAndRemoveUntil(ChatPage.route(), (route) => false);
          } else if (state is LoginError) {
            context.showErrorSnackBar(message: state.message);
          }
        },
        builder:
            (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Sign In')),
          body: LoginForm(),
        ),
      ),
    );*/
  }
}