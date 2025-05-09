// custom_calendar.dart
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatelessWidget {
  final DateTime selectedDay;
  final Function(DateTime) onDaySelected;

  const CustomCalendar({
    super.key,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: TableCalendar(
          focusedDay: selectedDay,
          firstDay: DateTime.now(),
          lastDay: DateTime.now().add(const Duration(days: 30)),
          selectedDayPredicate: (day) => isSameDay(selectedDay, day),
          onDaySelected: (selectedDay, _) {
            onDaySelected(selectedDay);
          },
        ),
      ),
    );
  }
}
