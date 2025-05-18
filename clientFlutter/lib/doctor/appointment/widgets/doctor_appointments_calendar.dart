import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/doctor/appointment/models/appointment_model.dart';
import 'package:medicare/doctor/appointment/state/doctor_appointment_cubit.dart';
import 'package:medicare/doctor/appointment/state/doctor_appointment_state.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DoctorAppointmentsCalendar extends StatefulWidget {
  const DoctorAppointmentsCalendar({Key? key}) : super(key: key);

  @override
  State<DoctorAppointmentsCalendar> createState() =>
      _DoctorAppointmentsCalendarState();
}

class _DoctorAppointmentsCalendarState
    extends State<DoctorAppointmentsCalendar> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorAppointmentCubit>().getDoctorAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAppointmentCubit, DoctorAppointmentState>(
      builder: (context, state) {
        if (state is DoctorAppointmentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DoctorAppointmentLoaded) {
          for (var appt in state.appointments) {
            print('Appointment local start: ${appt.startTime.toLocal()}');
            print('Appointment UTC start: ${appt.startTime.toUtc()}');
          }
          return SfCalendar(
            view: CalendarView.week,

            initialDisplayDate: DateTime.now(),
            dataSource: AppointmentDataSourceSyncfusion(state.appointments),
            onTap: (CalendarTapDetails details) {
              if (details.appointments != null &&
                  details.appointments!.isNotEmpty) {
                final AppointmentDto appt =
                    (details.appointments!.first as AppointmentDto);
                _showAppointmentDialog(context, appt);
              }
            },
            timeSlotViewSettings: const TimeSlotViewSettings(
              startHour: 1,
              endHour: 24,
              timeIntervalHeight: 60,
            ),
          );
        } else if (state is DoctorAppointmentError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void _showAppointmentDialog(BuildContext context, AppointmentDto appt) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Appointment with ${appt.patientId}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Start: ${appt.startTime}"),
                Text("Reason: ${appt.notes}"),
                Text("Status: ${appt.status}"),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<DoctorAppointmentCubit>()
                            .confirmAppointment(appt.id)
                            .then((_) {
                              context
                                  .read<DoctorAppointmentCubit>()
                                  .getDoctorAppointments(); // reload appointments
                            });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Confirm'),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        context
                            .read<DoctorAppointmentCubit>()
                            .rejectAppointment(appt.id)
                            .then((_) {
                              context
                                  .read<DoctorAppointmentCubit>()
                                  .getDoctorAppointments(); // reload appointments
                            });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Reject'),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}

class AppointmentDataSourceSyncfusion extends CalendarDataSource {
  AppointmentDataSourceSyncfusion(List<AppointmentDto> source) {
    appointments =
        source.map((appt) {
          return appt.copyWith(
            startTime: appt.startTime.toLocal(),
            endTime: appt.endTime.toLocal(),
          );
        }).toList();
  }

  @override
  DateTime getStartTime(int index) {
    final start = appointments![index].startTime;
    print('Calendar rendering appointment start: $start');
    return start;
  }

  @override
  DateTime getEndTime(int index) => appointments![index].endTime;

  @override
  String getSubject(int index) =>
      appointments![index].notes ?? "No reason provided";

  @override
  Color getColor(int index) => Colors.blueAccent;

  @override
  bool isAllDay(int index) => false;
}
