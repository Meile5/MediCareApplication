import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/widgets_shared/widgets.dart';
import 'package:medicare/patient/common/app_nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../appointments/screens/appointment_screen.dart';
import '../../appointments/state/appointment_cubit.dart';
import '../../models/models_for_mapping.dart';
import '../state/booking_cubit.dart';
import '../state/booking_state.dart';
import '../widgets/available_slots.dart';
import '../widgets/book_appointment_button.dart';
import '../widgets/custom_calendar.dart';

class CustomBookingCalendar extends StatefulWidget {
  final String selectedReason;
  final ClinicDoctorDto selectedDoctor;

  const CustomBookingCalendar(
      {super.key,
        required this.selectedReason,
        required this.selectedDoctor
      });

  @override
  State<CustomBookingCalendar> createState() => _CustomBookingCalendarState();
}

class _CustomBookingCalendarState extends State<CustomBookingCalendar> {
  DateTime _selectedDay = DateTime.now();
  AvailabilityDto? _selectedSlot;
  List<AvailabilityDto> _getFilteredTimeSlots(List<AvailabilityDto> allSlots) {
    return allSlots.where((slot) {
      return isSameDay(slot.startTime, _selectedDay);
    }).toList();
  }


  @override
  void initState() {
    super.initState();
    final doctorId = widget.selectedDoctor.doctorId;
    context.read<BookingCubit>().loadAvailableTimes(doctorId);
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
          CustomCalendar(
            selectedDay: _selectedDay,
            onDaySelected: (day) {
              setState(() {
                _selectedDay = day;
                _selectedSlot = null;
              });
            },
          ),
          Text("Available time slots for doctor ${widget.selectedDoctor.name} ${widget.selectedDoctor.surname}"),

          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<BookingCubit, BookingState>(
              builder: (context, state) {
                if (state is BookingLoaded) {
                  final allSlots = state.availableTimes;
                  final filteredSlots = _getFilteredTimeSlots(allSlots);
                  return CustomSlotGrid(
                    slots: filteredSlots,
                    selectedSlot: _selectedSlot,
                    onSlotSelected: (slot) {
                      setState(() {
                        if (_selectedSlot?.startTime != slot.startTime ||
                            _selectedSlot?.endTime != slot.endTime) {
                          _selectedSlot = slot;
                        } else {
                          _selectedSlot = null;
                        }
                      });
                    },
                  );
                }
                return const Center(child: Text('No available slots'));
              },
            ),
          ),
          BookAppointmentButton(
            selectedSlot: _selectedSlot,
            selectedReason: widget.selectedReason,
            selectedDoctor: widget.selectedDoctor,

          ),
          BlocListener<BookingCubit, BookingState>(
            listener: (context, state) {
              if (state is BookingSuccessful) {
                context.showSnackBar(message: state.message);
                /* microtask to ensure navigation completes first*/
                Future.microtask(() {
                  if (context.mounted) {
                    context.read<AppointmentCubit>().getFutureAppointments();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentScreen(),
                      ),
                    );                  }
                });
              } else if (state is BookingError) {
                context.showErrorSnackBar(message: state.message);
              }
            },
            child: const SizedBox.shrink(),
          )

        ],
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
