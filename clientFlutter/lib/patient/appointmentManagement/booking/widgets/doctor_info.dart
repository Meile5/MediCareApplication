import 'package:flutter/material.dart';
import 'package:medicare/patient/appointmentManagement/models/models_for_mapping.dart';

class DoctorInfo extends StatelessWidget {
  final List<ClinicDoctorDto> doctors;
  final ClinicDoctorDto? selectedDoctor;
  final void Function(ClinicDoctorDto) onDoctorSelected;

  const DoctorInfo({
    super.key,
    required this.doctors,
    required this.selectedDoctor,
    required this.onDoctorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: doctors.map((doctor) {
        final isSelected = selectedDoctor == doctor;

        return GestureDetector(
          onTap: () => onDoctorSelected(doctor),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blueAccent : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(50),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Text(
              '${doctor.name} ${doctor.surname}',
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ),

        );
      }).toList(),
    );

  }
}
