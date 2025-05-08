import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../account/login/login_page.dart';
import '../../patient/overview/OverviewScreen.dart';
import '../auth/auth_cubit.dart';
import '../auth/auth_state.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is Authenticated) {
          if (state.role == 'role-patient') {
            return OverviewScreen();
          } else if (state.role == 'role-doctor') {
            // placeholder screen for doctorscren
            return const Scaffold(
              body: Center(child: Text('Doctor dashboard coming soon...')),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text('Unknown role, please contact support.'),
              ),
            );
          }
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
