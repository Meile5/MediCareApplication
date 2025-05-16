import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/doctor/common/doctor_cubit.dart';
import 'package:medicare/doctor/common/doctor_navigator_manager.dart';

import '../../account/login/login_page.dart';
import '../../doctor/doctors_main_screan.dart';
import '../../patient/common/patient_cubit.dart';
import '../../patient/overview/screens/OverviewScreen.dart';
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
          // Load patient data when authenticated as patient
          if (state.role == 'role-patient') {
            context.read<PatientCubit>().loadPatient(state.userId);
            return const OverviewScreen();
          } else if (state.role == 'role-doctor') {
            context.read<DoctorCubit>().loadDoctor(state.userId);
            return const DoctorMainScreen();
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
