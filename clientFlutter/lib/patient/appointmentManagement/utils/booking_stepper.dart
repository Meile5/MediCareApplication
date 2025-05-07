import 'package:flutter/material.dart';
import 'package:medicare/common/widgets.dart';
import 'package:medicare/patient/appointmentManagement/booking/screens/reason_for_appointment_screen.dart';

import '../booking/screens/booking_calendar_screen.dart';

class BookingStepper extends StatefulWidget {
  @override
  _BookingStepperState createState() => _BookingStepperState();
}

class _BookingStepperState extends State<BookingStepper> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  String? selectedReason;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Row(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.blue, // This changes the active step color from purple to blue
                secondary: Colors.blue, // For buttons and other accents
              ),
              // For older Flutter versions that might still use these
              primaryColor: Colors.blue,
              buttonTheme: ButtonThemeData(
                buttonColor: Colors.blue,
                textTheme: ButtonTextTheme.primary,
              ),
            ),
            child: Expanded(child: Stepper(
              type: StepperType.horizontal,
              physics: ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue: continued,
              onStepCancel: cancel,
              steps: <Step>[
                Step(
                  title: new Text(''),
                  content: ReasonForAppointmentScreen(
                    selectedReason: selectedReason,
                    onReasonSelected: (reason) {
                      setState(() {
                        selectedReason = reason;
                      });
                    },
                  ),

                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0 ?
                  StepState.complete : StepState.disabled,
                ),
                Step(
                  title: new Text(''),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Home Address'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Postcode'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1 ?
                  StepState.complete : StepState.disabled,
                ),
                Step(
                  title: new Text(''),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Mobile Number'),
                      ),
                    ],
                  ),
                  isActive:_currentStep >= 0,
                  state: _currentStep >= 2 ?
                  StepState.complete : StepState.disabled,
                ),
              ],
            ),)
          ),
        ],
      ),
    );
  }


  tapped(int step){
    setState(() => _currentStep = step);
  }

  void continued() {
    if (_currentStep == 0 && (selectedReason == null || selectedReason!.isEmpty)) {
      context.showErrorSnackBar(message: "Please select or input a reason");
      return;
    }

    if (_currentStep < 2) {
      setState(() {
        _currentStep += 1;
      });
    } else {
      // On final step, navigate to the calendar screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomBookingCalendar(selectedReason: selectedReason!),
        ),
      );
    }
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}