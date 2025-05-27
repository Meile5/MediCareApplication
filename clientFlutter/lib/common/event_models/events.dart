import 'package:dart_mappable/dart_mappable.dart';

part 'events.mapper.dart';

@MappableClass(discriminatorKey: "eventType")
abstract class BaseEvent with BaseEventMappable {}

@MappableClass(discriminatorValue: "JoinRoom")
class JoinRoom extends BaseEvent with JoinRoomMappable {
  final String roomId;
  final String? token;

  JoinRoom({required this.roomId, required this.token});
}

@MappableClass(discriminatorValue: "JoinDoctorRoom")
class JoinDoctorRoom extends BaseEvent with JoinDoctorRoomMappable {
  final String roomId;

  JoinDoctorRoom({required this.roomId});
}

@MappableClass(discriminatorValue: "CancelledAppointment")
class CancelledAppointment extends BaseEvent with CancelledAppointmentMappable {
  final String appointmentId;

  CancelledAppointment({required this.appointmentId});
}
@MappableClass(discriminatorValue: "ApprovedAppointment")
class ApprovedAppointment extends BaseEvent with ApprovedAppointmentMappable {
  final String appointmentId;

  ApprovedAppointment({required this.appointmentId});
}
@MappableClass(discriminatorValue: "AppointmentDoctorSide")
class AppointmentDoctorSideDto extends BaseEvent
    with AppointmentDoctorSideDtoMappable {
  final String id;
  final String doctorId;
  final String patientId;
  final String status;
  final String notes;
  final DateTime startTime;
  final DateTime endTime;

  AppointmentDoctorSideDto({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.status,
    required this.notes,
    required this.startTime,
    required this.endTime,
  });
}

@MappableClass(discriminatorValue: "BroadcastApprovedSlotDto")
class BroadcastApprovedSlotDto extends BaseEvent with BroadcastApprovedSlotDtoMappable {
  final DateTime startTime;
  final DateTime endTime;


  BroadcastApprovedSlotDto({ required this.startTime, required this.endTime});
}



@MappableClass(discriminatorValue: "ServerMessage")
class ServerMessage extends BaseEvent with ServerMessageMappable {
  final String roomId;
  final String message;

  ServerMessage({required this.roomId, required this.message});
}

@MappableClass(discriminatorValue: "ChatMessage")
class ChatMessage extends BaseEvent with ChatMessageMappable {
  final String roomId;
  final String userId;
  final String name;
  final String message;
  final String? token;

  ChatMessage({
    required this.roomId,
    required this.userId,
    required this.name,
    required this.message,
    required this.token,
  });
}

@MappableClass(discriminatorValue: "UnsubscribeFromChat")
class UnsubscribeFromChat extends BaseEvent with UnsubscribeFromChatMappable {
  final String roomId;

  UnsubscribeFromChat({required this.roomId});
}

@MappableClass(discriminatorValue: "DeviceVitals")
class DeviceVitals extends BaseEvent with DeviceVitalsMappable {
  final String userId;
  final String deviceId;
  final double temperature;
  final List<int> ecg;

  final int? heartRate;
  final int? spo2;

  DeviceVitals({
    required this.userId,
    required this.deviceId,
    required this.temperature,
    required this.ecg,
    this.heartRate,
    this.spo2,
  });
}

@MappableClass(discriminatorValue: "SubscribeToVitals")
class SubscribeToVitals extends BaseEvent with SubscribeToVitalsMappable {
  final String deviceId;
  final String? token;

  SubscribeToVitals({required this.deviceId, required this.token});
}

@MappableClass(discriminatorValue: "SubscribeSuccess")
class SubscribeSuccess extends BaseEvent with SubscribeSuccessMappable {
  final String message;

  SubscribeSuccess({required this.message});
}

@MappableClass(discriminatorValue: "UnsubscribeFromVitals")
class UnsubscribeFromVitals extends BaseEvent
    with UnsubscribeFromVitalsMappable {
  final String deviceId;

  UnsubscribeFromVitals({required this.deviceId});
}

@MappableClass(discriminatorValue: "UnsubscribeSuccess")
class UnsubscribeSuccess extends BaseEvent with UnsubscribeSuccessMappable {
  final String message;

  UnsubscribeSuccess({required this.message});
}
