// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_models.dart';

class ChatRoomDtoMapper extends ClassMapperBase<ChatRoomDto> {
  ChatRoomDtoMapper._();

  static ChatRoomDtoMapper? _instance;
  static ChatRoomDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatRoomDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatRoomDto';

  static String _$id(ChatRoomDto v) => v.id;
  static const Field<ChatRoomDto, String> _f$id = Field('id', _$id);
  static String _$doctorId(ChatRoomDto v) => v.doctorId;
  static const Field<ChatRoomDto, String> _f$doctorId =
      Field('doctorId', _$doctorId);
  static String _$patientId(ChatRoomDto v) => v.patientId;
  static const Field<ChatRoomDto, String> _f$patientId =
      Field('patientId', _$patientId);
  static String _$topic(ChatRoomDto v) => v.topic;
  static const Field<ChatRoomDto, String> _f$topic = Field('topic', _$topic);
  static bool _$isFinished(ChatRoomDto v) => v.isFinished;
  static const Field<ChatRoomDto, bool> _f$isFinished =
      Field('isFinished', _$isFinished);
  static DateTime _$createdAt(ChatRoomDto v) => v.createdAt;
  static const Field<ChatRoomDto, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static DateTime _$startTime(ChatRoomDto v) => v.startTime;
  static const Field<ChatRoomDto, DateTime> _f$startTime =
      Field('startTime', _$startTime);
  static DateTime _$endTime(ChatRoomDto v) => v.endTime;
  static const Field<ChatRoomDto, DateTime> _f$endTime =
      Field('endTime', _$endTime);

  @override
  final MappableFields<ChatRoomDto> fields = const {
    #id: _f$id,
    #doctorId: _f$doctorId,
    #patientId: _f$patientId,
    #topic: _f$topic,
    #isFinished: _f$isFinished,
    #createdAt: _f$createdAt,
    #startTime: _f$startTime,
    #endTime: _f$endTime,
  };

  static ChatRoomDto _instantiate(DecodingData data) {
    return ChatRoomDto(
        id: data.dec(_f$id),
        doctorId: data.dec(_f$doctorId),
        patientId: data.dec(_f$patientId),
        topic: data.dec(_f$topic),
        isFinished: data.dec(_f$isFinished),
        createdAt: data.dec(_f$createdAt),
        startTime: data.dec(_f$startTime),
        endTime: data.dec(_f$endTime));
  }

  @override
  final Function instantiate = _instantiate;

  static ChatRoomDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatRoomDto>(map);
  }

  static ChatRoomDto fromJson(String json) {
    return ensureInitialized().decodeJson<ChatRoomDto>(json);
  }
}

mixin ChatRoomDtoMappable {
  String toJson() {
    return ChatRoomDtoMapper.ensureInitialized()
        .encodeJson<ChatRoomDto>(this as ChatRoomDto);
  }

  Map<String, dynamic> toMap() {
    return ChatRoomDtoMapper.ensureInitialized()
        .encodeMap<ChatRoomDto>(this as ChatRoomDto);
  }

  ChatRoomDtoCopyWith<ChatRoomDto, ChatRoomDto, ChatRoomDto> get copyWith =>
      _ChatRoomDtoCopyWithImpl<ChatRoomDto, ChatRoomDto>(
          this as ChatRoomDto, $identity, $identity);
  @override
  String toString() {
    return ChatRoomDtoMapper.ensureInitialized()
        .stringifyValue(this as ChatRoomDto);
  }

  @override
  bool operator ==(Object other) {
    return ChatRoomDtoMapper.ensureInitialized()
        .equalsValue(this as ChatRoomDto, other);
  }

  @override
  int get hashCode {
    return ChatRoomDtoMapper.ensureInitialized().hashValue(this as ChatRoomDto);
  }
}

extension ChatRoomDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatRoomDto, $Out> {
  ChatRoomDtoCopyWith<$R, ChatRoomDto, $Out> get $asChatRoomDto =>
      $base.as((v, t, t2) => _ChatRoomDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatRoomDtoCopyWith<$R, $In extends ChatRoomDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? doctorId,
      String? patientId,
      String? topic,
      bool? isFinished,
      DateTime? createdAt,
      DateTime? startTime,
      DateTime? endTime});
  ChatRoomDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatRoomDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatRoomDto, $Out>
    implements ChatRoomDtoCopyWith<$R, ChatRoomDto, $Out> {
  _ChatRoomDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatRoomDto> $mapper =
      ChatRoomDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? doctorId,
          String? patientId,
          String? topic,
          bool? isFinished,
          DateTime? createdAt,
          DateTime? startTime,
          DateTime? endTime}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (doctorId != null) #doctorId: doctorId,
        if (patientId != null) #patientId: patientId,
        if (topic != null) #topic: topic,
        if (isFinished != null) #isFinished: isFinished,
        if (createdAt != null) #createdAt: createdAt,
        if (startTime != null) #startTime: startTime,
        if (endTime != null) #endTime: endTime
      }));
  @override
  ChatRoomDto $make(CopyWithData data) => ChatRoomDto(
      id: data.get(#id, or: $value.id),
      doctorId: data.get(#doctorId, or: $value.doctorId),
      patientId: data.get(#patientId, or: $value.patientId),
      topic: data.get(#topic, or: $value.topic),
      isFinished: data.get(#isFinished, or: $value.isFinished),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      startTime: data.get(#startTime, or: $value.startTime),
      endTime: data.get(#endTime, or: $value.endTime));

  @override
  ChatRoomDtoCopyWith<$R2, ChatRoomDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChatRoomDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
