import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models_appointments.dart';
import '../../models/models_for_mapping.dart';
import '../state/booking_cubit.dart';

class BookAppointmentButton extends StatelessWidget{
  final AvailableDates? selectedSlot;

  final String selectedReason;


  const BookAppointmentButton({
    super.key,
    required this.selectedSlot,
    required this.selectedReason,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: selectedSlot == null
            ? null
            : () {

          final selectedTime = selectedSlot!.startTime;
          print('rason: $selectedReason');

          final appointmentDto = BookAppointmentDto(
            startTime: selectedSlot!.startTime!,
            endTime: selectedSlot!.endTime!,
            patientId: 'user123',
            doctorId: 'user-doctor-1',
          );
          final chatRoomDto = CreateChatRoomDto(
            doctorId: 'user-doctor-1',
            patientId: 'user123',
            topic: selectedReason,
            startTime: selectedSlot!.startTime!,
            endTime: selectedSlot!.endTime!,
          );
          final bookingRequestDto = BookAppointmentRequest(
            appointment: appointmentDto,
            chatRoom: chatRoomDto,
          );

          context.read<BookingCubit>().bookAppointment(bookingRequestDto);

          print('Selected time: $selectedTime');


        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: const Text('Book Appointment'),
      ),
    );
  }

}