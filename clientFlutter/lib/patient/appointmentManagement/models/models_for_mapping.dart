import 'package:dart_mappable/dart_mappable.dart';

part 'models_for_mapping.mapper.dart';

@MappableClass()
class BookAppointmentDto with BookAppointmentDtoMappable {
  final DateTime startTime;
  final DateTime endTime;
  final String patientId;
  final String doctorId;

  BookAppointmentDto({
    required this.startTime,
    required this.endTime,
    required this.patientId,
    required this.doctorId,
  });

  /// Override the map to ensure proper date formatting
  /*@override
  Map<String, dynamic> toMap() {
    return {
      'startTime': startTime.toUtc().toIso8601String(),
      'endTime': endTime.toUtc().toIso8601String(),
      'patientId': patientId,
      'doctorId': doctorId,
    };
  }*/

}
@MappableClass()
class FutureAppointmentsDto with FutureAppointmentsDtoMappable {
  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final String status;

  FutureAppointmentsDto({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.status,
  });
}

@MappableClass()
class PastAppointmentsDto with PastAppointmentsDtoMappable {
  final DateTime startTime;
  final DateTime endTime;


  PastAppointmentsDto({
    required this.startTime,
    required this.endTime,
  });
}


@MappableClass()
class CancelAppointmentDto with CancelAppointmentDtoMappable {
  final String id;
  final String status;


  CancelAppointmentDto({
    required this.id,
    required this.status,
  });



}


