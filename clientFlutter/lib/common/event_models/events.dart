import 'package:dart_mappable/dart_mappable.dart';

part 'events.mapper.dart';

@MappableClass(discriminatorKey: "eventType")
abstract class BaseEvent with BaseEventMappable {}

@MappableClass(discriminatorValue: "JoinRoom")
class JoinRoom extends BaseEvent with JoinRoomMappable {
  final String roomId;

  JoinRoom({required this.roomId});
}

@MappableClass(discriminatorValue: "JoinDoctorRoom")
class JoinDoctorRoom extends BaseEvent with JoinDoctorRoomMappable {
  final String roomId;

  JoinDoctorRoom({required this.roomId});
}

@MappableClass(discriminatorValue: "BroadcastBookedSlot")
class BroadcastBookedSlot extends BaseEvent with BroadcastBookedSlotMappable {
  final String id;

  BroadcastBookedSlot({required this.id});
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

  ChatMessage({
    required this.roomId,
    required this.userId,
    required this.name,
    required this.message,
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

  DeviceVitals({
    required this.userId,
    required this.deviceId,
    required this.temperature,
    required this.ecg,
  });
}

@MappableClass(discriminatorValue: "SubscribeToVitals")
class SubscribeToVitals extends BaseEvent with SubscribeToVitalsMappable {
  final String deviceId;

  SubscribeToVitals({required this.deviceId});
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
