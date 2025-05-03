import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medicare/common/widgets.dart';
import 'package:medicare/patient/appointment/models_appointments.dart';
import 'package:medicare/patient/common/app_nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'appointment_cubit.dart';
import 'appointment_state.dart';
import 'models_for_mapping.dart';

class CustomBookingCalendar extends StatefulWidget {
  const CustomBookingCalendar({super.key});

  @override
  State<CustomBookingCalendar> createState() => _CustomBookingCalendarState();
}

class _CustomBookingCalendarState extends State<CustomBookingCalendar> {
  DateTime _selectedDay = DateTime.now();
  AvailableDates? _selectedSlot;
  List<AvailableDates> _getFilteredTimeSlots(List<AvailableDates> allSlots) {
    return allSlots.where((slot) {
      return isSameDay(slot.startTime, _selectedDay);
    }).toList();
  }


  @override
  void initState() {
    super.initState();
    // Load available times as soon as the widget is created
    final doctorId = 'user-doctor-1'; // You can replace this with the actual doctor ID
    context.read<AppointmentCubit>().loadAvailableTimes(doctorId);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
           alignment: Alignment.topLeft,
           child: BackButton(
           )
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )],
            ),
            child: TableCalendar(
              focusedDay: _selectedDay,
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(const Duration(days: 30)),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, _) {
                setState(() =>
                _selectedDay = selectedDay);
                _selectedSlot = null;
              },
            ),

          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<AppointmentCubit, AppointmentState>(
              builder: (context, state) {
                if (state is AppointmentLoaded) {
                  final allSlots = state.availableTimes.availableDates;
                  final filteredSlots = _getFilteredTimeSlots(allSlots!);

                  return GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: filteredSlots.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 3.5,
                    ),
                    itemBuilder: (context, index) {
                      final slot = filteredSlots[index];
                      final isSelected = _selectedSlot == slot;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // Select the slot if it's not already selected, otherwise deselect
                            if (_selectedSlot?.startTime != slot.startTime || _selectedSlot?.endTime != slot.endTime) {
                              _selectedSlot = slot;
                            } else {
                              _selectedSlot = null;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blueAccent : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: isSelected
                                ? Border.all(color: Colors.blue, width: 2)
                                : null,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              )],
                          ),
                          child: Center(
                            child: Text(
                              DateFormat('hh:mm a').format(slot.startTime!),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      );

                    },
                  );

                }

                return const Center(child: Text('No available slots'));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: _selectedSlot == null
                  ? null
                  : () {

                final selectedTime = _selectedSlot!.startTime;
                final appointmentDto = BookAppointmentDto(
                  startTime: _selectedSlot!.startTime!,
                  endTime: _selectedSlot!.endTime!,
                  patientId: 'user123',
                  doctorId: 'user-doctor-1',
                );

                context.read<AppointmentCubit>().bookAppointment(appointmentDto);

                print('Selected time: $selectedTime');


              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Book Appointment'),
            ),
          ),
          BlocListener<AppointmentCubit, AppointmentState>(
            listener: (context, state) {
              if (state is AppointmentBookedSuccessfully) {
                context.showSnackBar(message: state.message);
              } else if (state is AppointmentError) {
                context.showErrorSnackBar(message: state.message);
              }
            },
            child: const SizedBox.shrink(), // Empty widget, just for listener
          )

        ],
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
