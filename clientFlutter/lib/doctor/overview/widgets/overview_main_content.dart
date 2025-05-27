import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/auth/auth_prefs.dart';
import '../../../common/chat/utils/chat_data_source.dart';
import '../../common/doctor_data_source.dart';
import '../../patient_overview/utils/patients_overview_data_source.dart';

class DoctorOverviewMainContent extends StatefulWidget {
  const DoctorOverviewMainContent({super.key});

  @override
  State<DoctorOverviewMainContent> createState() =>
      _DoctorOverviewMainContentState();
}

class _DoctorOverviewMainContentState extends State<DoctorOverviewMainContent> {
  String doctorName = '';
  int todayChatCount = 0;
  int totalPatients = 0;
  int completedAppointments = 0;
  int unfinishedAppointments = 0;
  String doctorEmail = '';
  String doctorSpeciality = '';
  String doctorAge = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final doctor = await DoctorDataSource().getDoctorById(AuthPrefs.userId!);
    final clinicList = await DoctorDataSource().retrieveClinicInfo();
    final chats = await ChatDataSource().getChatRoomsForDoctor();

    final today = DateTime.now();
    final todayChats =
        chats.where((chat) {
          final created = chat.startTime.toLocal();
          return created.year == today.year &&
              created.month == today.month &&
              created.day == today.day;
        }).length;

    final completedChats = chats.where((chat) => chat.isFinished).length;

    // Get the clinicId safely
    final clinicId = clinicList.isNotEmpty ? clinicList.first.id : null;

    int patientCount = 0;
    if (clinicId != null) {
      final patients = await PatientsOverviewDataSource().getPatients(clinicId);
      patientCount = patients.length;
    }

    final unfinishedChats = chats.where((chat) => !chat.isFinished).length;

    setState(() {
      doctorName = doctor.name;
      doctorEmail = AuthPrefs.email!;
      doctorSpeciality = doctor.specialty;
      doctorAge = doctor.age;

      todayChatCount = todayChats;
      completedAppointments = completedChats;
      unfinishedAppointments = unfinishedChats;
      totalPatients = patientCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Dr. $doctorName 👋',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _doctorInfoCard(
                email: doctorEmail,
                speciality: doctorSpeciality,
                age: doctorAge,
              ),
              const SizedBox(width: 16),
              _infoCard(
                title: "Today's Chatrooms",
                value: '$todayChatCount',
                icon: FontAwesomeIcons.message,
              ),
            ],
          ),
          Row(
            children: [
              _infoCard(
                title: "Unfinished Appointments",
                value: '$unfinishedAppointments',
                icon: FontAwesomeIcons.clock,
              ),
              const SizedBox(width: 16),
              _infoCard(
                title: "Completed Appointments",
                value: '$completedAppointments',
                icon: FontAwesomeIcons.check,
              ),
            ],
          ),

          Row(
            children: [
              _infoCard(
                title: "Patients under your care",
                value: '$totalPatients',
                icon: FontAwesomeIcons.peopleLine,
              ),
              const SizedBox(width: 16),
              _infoCard(
                title: "Contact Support",
                value: "1-800-MEDICARE",
                icon: FontAwesomeIcons.phone,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Colors.blue),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _doctorInfoCard({
    required String email,
    required String speciality,
    required String age,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.user, size: 32, color: Colors.blue),
              const SizedBox(height: 12),
              Text("Email: $email", style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 4),
              Text(
                "Specialty: $speciality",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text("Age: $age", style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
