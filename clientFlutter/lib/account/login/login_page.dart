import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/auth/auth_cubit.dart';

import 'login_cubit.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(context.read<AuthCubit>()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;
          return Scaffold(
            body:
                isWide
                    ? Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.blueAccent,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.medical_services,
                                      color: Colors.white,
                                      size: 100,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "Your health, our priority.\nWelcome to the future of care.",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Right side login form
                        Expanded(flex: 3, child: Center(child: LoginForm())),
                      ],
                    )
                    : Center(child: LoginForm()),
          );
        },
      ),
    );
  }
}
