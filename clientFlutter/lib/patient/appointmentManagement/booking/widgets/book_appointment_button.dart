import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medicare/common/widgets_shared/reusable_dialog.dart';
import '../../../../common/auth/auth_prefs.dart';
import '../../models/models_for_mapping.dart';
import '../state/booking_cubit.dart';

class BookAppointmentButton extends StatelessWidget{
  final AvailabilityDto? selectedSlot;

  final String selectedReason;

  final ClinicDoctorDto selectedDoctor;


  const BookAppointmentButton({
    super.key,
    required this.selectedSlot,
    required this.selectedReason,
    required this.selectedDoctor,

  });

  String formatDate(DateTime? date) {
    if (date == null) return 'Invalid date';
    final formattedDate = DateFormat.yMMMMd().format(date);
    final formattedTime = DateFormat('jm').format(date);
    return '$formattedDate, $formattedTime';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed:selectedSlot == null
            ? null  :()
        async {
          await showDialog(
            context: context,
            builder: (context) => ReusableDialog(
              title: 'Confirm Booking',
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Doctor: ${selectedDoctor.name} ${selectedDoctor.surname}"),
                  const SizedBox(height: 8),
                  Text("Reason: $selectedReason"),
                  const SizedBox(height: 8),
                  Text("Time: ${formatDate(selectedSlot!.startTime)}"),
                ],
              ),
                onConfirm: () async {
                 final appointmentDto = BookAppointmentDto(
                    startTime: selectedSlot!.startTime,
                    endTime: selectedSlot!.endTime,
                    patientId: AuthPrefs.userId!,
                    doctorId: selectedDoctor.doctorId,
                    notes: selectedReason,
                  );

                  final chatRoomDto = CreateChatRoomDto(
                    doctorId: selectedDoctor.doctorId,
                    patientId: AuthPrefs.userId!,
                    topic: selectedReason,
                    startTime: selectedSlot!.startTime,
                    isFinished: false,
                    endTime: selectedSlot!.endTime,
                  );

                  final bookingRequestDto = BookAppointmentRequest(
                    appointment: appointmentDto,
                    chatRoom: chatRoomDto,
                  );

                  context.read<BookingCubit>().bookAppointment(bookingRequestDto);

                }

            ),
          );
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