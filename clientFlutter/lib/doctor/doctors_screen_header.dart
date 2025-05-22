import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/doctor/common/doctor_cubit.dart';

class DoctorsScreenHeader extends StatelessWidget {
  const DoctorsScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              SizedBox(width: 30),
              FaIcon(
                FontAwesomeIcons.userDoctor,
                color: Colors.blueAccent,
                size: 25,
              ),
              SizedBox(width: 12),
              Text(
                'MediCare',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          BlocBuilder<DoctorCubit, DoctorState>(
            builder: (context, state) {
              final doctorName = state.doctor?.name ?? 'Loading...';
              return Row(
                children: [
                  Text(
                    "Dr. " + doctorName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
