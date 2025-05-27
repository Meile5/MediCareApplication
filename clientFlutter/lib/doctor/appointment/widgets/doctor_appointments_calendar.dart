import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medicare/doctor/appointment/models/appointment_model.dart';
import 'package:medicare/doctor/appointment/state/doctor_appointment_cubit.dart';
import 'package:medicare/doctor/appointment/state/doctor_appointment_state.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/doctor_cubit.dart';

class DoctorAppointmentsCalendar extends StatefulWidget {
  const DoctorAppointmentsCalendar({Key? key}) : super(key: key);

  @override
  State<DoctorAppointmentsCalendar> createState() =>
      _DoctorAppointmentsCalendarState();
}

class _DoctorAppointmentsCalendarState
    extends State<DoctorAppointmentsCalendar> {
  late DoctorAppointmentCubit _doctorAppointmentCubit;
  String? _doctorId;

  @override
  void initState() {
    super.initState();

    _doctorAppointmentCubit = context.read<DoctorAppointmentCubit>();
    _doctorAppointmentCubit.getDoctorAppointments();

    final doctor = context.read<DoctorCubit>().state.doctor;
    if (doctor != null) {
      _doctorId = doctor.doctorid;
      _doctorAppointmentCubit.joinRoom(_doctorId!);
    }
  }

  @override
  void dispose() {
    if (_doctorId != null) {
      _doctorAppointmentCubit.unsubscribeFromRoom(_doctorId!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAppointmentCubit, DoctorAppointmentState>(
      builder: (context, state) {
        if (state is DoctorAppointmentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DoctorAppointmentLoaded) {
          for (var appt in state.appointments) {
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12,
                ),
                child: Text(
                  "Your Weekly Appointments",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: SfCalendar(
                  view: CalendarView.week,
                  initialDisplayDate: DateTime.now(),
                  dataSource: AppointmentDataSourceSyncfusion(
                    state.appointments,
                  ),
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
                ),
              ),
            ],
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
    String formatDate(DateTime date) {
      final local = date.toLocal();
      final formattedDate = DateFormat.yMMMMd().format(local);
      final formattedTime = DateFormat('jm').format(local);
      return '$formattedDate,  $formattedTime';
    }

    showDialog(
      context: context,
      builder:
          (_) => FutureBuilder<String>(
            future: context
                .read<DoctorAppointmentCubit>()
                .dataSource
                .getPatientName(appt.id),
            builder: (context, snapshot) {
              final patientName = snapshot.data ?? appt.patientId;

              return AlertDialog(
                title: Text('Appointment with $patientName'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Starts at:"),
                    Text(formatDate(appt.startTime)),
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
                                .confirmAppointment(appt, appt.patientId)
                                .then((_) {
                                  context
                                      .read<DoctorAppointmentCubit>()
                                      .getDoctorAppointments();
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
                                .rejectAppointment(appt.id, appt.patientId)
                                .then((_) {
                                  context
                                      .read<DoctorAppointmentCubit>()
                                      .getDoctorAppointments();
                                });
                            Navigator.of(context).pop();
                          },
                          child: const Text('Reject'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
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
  Color getColor(int index) {
    final appointment = appointments![index] as AppointmentDto;
    switch (appointment.status) {
      case 'Cancelled':
        return Colors.red;
      case 'Confirmed':
        return Colors.green;
      case 'Pending':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  bool isAllDay(int index) => false;
}
