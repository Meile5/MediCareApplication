import 'package:flutter/material.dart';
import 'package:medicare/common/widgets.dart';
import 'package:medicare/patient/appointmentManagement/booking/screens/choose_doctor_screen.dart';
import '../../../../errorHandling/application_messages.dart';
import '../../../common/app_nav_bar.dart';
import '../widgets/appointment_reason.dart';
import 'booking_calendar_screen.dart';

class ReasonForAppointmentScreen extends StatefulWidget {
  const ReasonForAppointmentScreen({super.key});

  @override
  State<ReasonForAppointmentScreen> createState() => _ReasonForAppointmentScreenState();
}

class _ReasonForAppointmentScreenState extends State<ReasonForAppointmentScreen> {
  String? selectedReason;
  final FocusNode _textFieldFocus = FocusNode();

  static const List<String> reasons  = [
    'Routine check-up',
    'Headaches',
    'Chest pain',
    'Back pain',
    'Fever',
    'Fatigue',
    'Sore throat'
  ];
  /* Lets to get the current text from the textfield on type*/
  final TextEditingController _reasonController = TextEditingController();
  @override
  void dispose() {
    _reasonController.dispose();
    _textFieldFocus.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          selectedReason = null; // deselect reason
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reason for appointment'), centerTitle: true,),
      body: Column(
        children: [
          Expanded(
            child: AppointmentReason(
              reasons: reasons,
              selectedReason: selectedReason,
              onReasonSelected: (reason) {
                setState(() {
                  selectedReason = reason;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _reasonController,
              focusNode: _textFieldFocus,
            decoration: InputDecoration(
              labelText: 'Enter your reason',
              border: OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.blueAccent),

              ),
            ),
              onChanged: (text) {
                setState(() {
                  selectedReason = text.isNotEmpty ? text : null;
                });
              },
          ),),
          const SizedBox(height: 40),

          ElevatedButton(
            onPressed: () {
              if (selectedReason != null || _reasonController.text.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseDoctorScreen(selectedReason: selectedReason!),

                    ));
                // Navigate or process
              } else {
                context.showErrorSnackBar(message: ApplicationMessages.selectReason.message);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
            child: const Text("Next"),
          ),
          const SizedBox(height: 50),

        ],
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
