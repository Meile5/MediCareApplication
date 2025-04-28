import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../common/theme.dart';

class BookCalendar extends StatefulWidget {
  const BookCalendar({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _BookCalendarState createState() => _BookCalendarState();
}

class _BookCalendarState extends State<BookCalendar> {
  late BookingService mockBookingService;
  late DateTime _now;
  List<DateTimeRange> converted = [];

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();

    // Safe to call this here if you're rendering in a standalone test.
    initializeDateFormatting();

    mockBookingService = BookingService(
      serviceName: 'Mock Service',
      serviceDuration: 30,
      bookingStart: DateTime(_now.year, _now.month, _now.day, 8, 0),
      bookingEnd: DateTime(_now.year, _now.month, _now.day, 18, 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: CalendarTheme.theme,
      child: BookingCalendar(
        bookingService: mockBookingService,
        convertStreamResultToDateTimeRanges: convertStreamResultMock,
        getBookingStream: getBookingStreamMock,
        uploadBooking: uploadBookingMock,
        pauseSlots: generatePauseSlots(),
        pauseSlotText: 'LUNCH',
        hideBreakTime: false,
        loadingWidget: const Text('Fetching data...'),
        uploadingWidget: const CircularProgressIndicator(),
        locale: 'en_US',
        startingDayOfWeek: StartingDayOfWeek.tuesday,
        wholeDayIsBookedWidget: const Text('Sorry, for this day everything is booked'),
        //disabledDates: [DateTime(2023, 1, 20)],
        //disabledDays: [6, 7],
        availableSlotColor: Colors.white, // light green for available
       // bookedSlotColor: Colors.black87,

        selectedSlotColor: Colors.blueAccent, // highlight on tap
        pauseSlotColor: Colors.orange[200], // break/pause slot
        bookingButtonColor: Colors.blueAccent,

      ),
    );
  }


  Stream<dynamic>? getBookingStreamMock({
    required DateTime end,
    required DateTime start,
  }) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock({required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
      start: newBooking.bookingStart,
      end: newBooking.bookingEnd,
    ));
    print('${newBooking.toJson()} has been uploaded');
  }

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
        start: DateTime(_now.year, _now.month, _now.day, 12, 0),
        end: DateTime(_now.year, _now.month, _now.day, 13, 0),
      )
    ];
  }
}
