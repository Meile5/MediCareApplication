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
  @override
  Map<String, dynamic> toMap() {
    return {
      'startTime': startTime.toUtc().toIso8601String(),
      'endTime': endTime.toUtc().toIso8601String(),
      'patientId': patientId,
      'doctorId': doctorId,
    };
  }

}

