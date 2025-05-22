import 'package:dart_mappable/dart_mappable.dart';

part 'models_for_mapping.mapper.dart';

@MappableClass()
class BookAppointmentDto with BookAppointmentDtoMappable {
  final DateTime startTime;
  final DateTime endTime;
  final String patientId;
  final String doctorId;
  final String notes;

  BookAppointmentDto({
    required this.startTime,
    required this.endTime,
    required this.patientId,
    required this.doctorId,
    required this.notes,
  });
}

@MappableClass()
class FutureAppointmentsDto with FutureAppointmentsDtoMappable {
  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final String status;
  final String notes;
  final String doctorId;

  FutureAppointmentsDto({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.notes,
    required this.doctorId,
  });
}

@MappableClass()
class PastAppointmentsDto with PastAppointmentsDtoMappable {
  final DateTime startTime;
  final DateTime endTime;
  final String notes;

  PastAppointmentsDto({
    required this.startTime,
    required this.endTime,
    required this.notes,
  });
}

@MappableClass()
class CancelAppointmentDto with CancelAppointmentDtoMappable {
  final String id;
  final String status;
  final String doctorId;

  CancelAppointmentDto({
    required this.id,
    required this.status,
    required this.doctorId,
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

@MappableClass()
class BookAppointmentRequest with BookAppointmentRequestMappable {
  final BookAppointmentDto appointment;

  BookAppointmentRequest({required this.appointment});
}

@MappableClass()
class ClinicDoctorDto with ClinicDoctorDtoMappable {
  final String doctorId;
  final String name;
  final String surname;

  ClinicDoctorDto({
    required this.doctorId,
    required this.name,
    required this.surname,
  });
}

@MappableClass()
class AvailabilityDto with AvailabilityDtoMappable {
  final DateTime startTime;
  final DateTime endTime;

  AvailabilityDto({required this.startTime, required this.endTime});
}
