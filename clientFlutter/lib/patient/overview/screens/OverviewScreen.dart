import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/patient/common/app_nav_bar.dart';
import 'package:medicare/patient/overview/state/overview_cubit.dart';

import '../state/overview_state.dart';
import '../widgets/clinic_info.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  void initState() {
    super.initState();
    final userId = "user123";
    context.read<OverviewCubit>().retrieveClinicInfo(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<OverviewCubit, OverviewState>(
          builder: (context, state) {
            if (state is ClinicInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ClinicInfoLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.clinicInfo.length,
                itemBuilder: (context, index) {
                  final clinic = state.clinicInfo[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ClinicInfo(clinicInfo: clinic),
                  );
                },
              );
            } else if (state is ClinicInfoError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No appointments found.'));
            }
          },
        ),
      ),
      bottomNavigationBar: const AppNavBar(),
    );
  }
}