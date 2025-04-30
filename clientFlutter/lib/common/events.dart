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
class ChatMessage extends BaseEvent with ServerMessageMappable {
  final String roomId;
  final String message;

  ChatMessage({required this.roomId, required this.message});
}
