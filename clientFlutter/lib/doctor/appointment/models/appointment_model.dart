import 'package:dart_mappable/dart_mappable.dart';

part 'appointment_model.mapper.dart';

@MappableClass()
class AppointmentDto with AppointmentDtoMappable {
  final String id;
  final String doctorId;
  final String patientId;
  final String status;
  final String notes;
  final DateTime? createdAt;
  final DateTime updatedAt;
  final DateTime startTime;
  final DateTime endTime;

  AppointmentDto({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.status,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.startTime,
    required this.endTime,
  });
}

@MappableClass()
class CreateChatRoomDto with CreateChatRoomDtoMappable {
  final String doctorId;
  final String patientId;
  final String topic;
  final bool isFinished;
  final DateTime startTime;
  final DateTime endTime;

  CreateChatRoomDto({
    required this.doctorId,
    required this.patientId,
    required this.topic,
    required this.startTime,
    required this.isFinished,
    required this.endTime,
  });
}
