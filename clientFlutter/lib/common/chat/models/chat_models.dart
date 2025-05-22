import 'package:dart_mappable/dart_mappable.dart';

part 'chat_models.mapper.dart';

@MappableClass()
class ChatRoomDto with ChatRoomDtoMappable {
  final String id;
  final String doctorId;
  final String patientId;
  final String topic;
  final bool isFinished;
  final DateTime createdAt;
  final DateTime startTime;
  final DateTime endTime;

  ChatRoomDto({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.topic,
    required this.isFinished,
    required this.createdAt,
    required this.startTime,
    required this.endTime,
  });
}
