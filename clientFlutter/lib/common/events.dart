import 'package:dart_mappable/dart_mappable.dart';

part 'events.mapper.dart';

@MappableClass(discriminatorKey: "eventType")
abstract class BaseEvent with BaseEventMappable {}

@MappableClass(discriminatorValue: "JoinRoom")
class JoinRoom extends BaseEvent with JoinRoomMappable {
  final String roomId;

  JoinRoom({required this.roomId});
}

@MappableClass(discriminatorValue: "ServerMessage")
class ServerMessage extends BaseEvent with ServerMessageMappable {
  final String roomId;
  final String message;

  ServerMessage({required this.roomId, required this.message});
}

@MappableClass(discriminatorValue: "ChatMessage")
class ChatMessage extends BaseEvent with ServerMessageMappable {
  final String roomId;
  final String message;

  ChatMessage({required this.roomId, required this.message});
}

@MappableClass(discriminatorValue: "DeviceVitals")
class DeviceVitals extends BaseEvent with DeviceVitalsMappable {
  final String userId;
  final String deviceId;
  final double temperature;

  DeviceVitals({
    required this.userId,
    required this.deviceId,
    required this.temperature,
  });
}

@MappableClass(discriminatorValue: "SubscribeToVitals")
class SubscribeToVitals extends BaseEvent with SubscribeToVitalsMappable {
  final String userId;
  final String deviceId;

  SubscribeToVitals({required this.deviceId, required this.userId});
}

@MappableClass(discriminatorValue: "SubscribeSuccess")
class SubscribeSuccess extends BaseEvent with SubscribeSuccessMappable {
  final String message;

  SubscribeSuccess({required this.message});
}
