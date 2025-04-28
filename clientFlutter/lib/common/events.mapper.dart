// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'events.dart';

class BaseEventMapper extends ClassMapperBase<BaseEvent> {
  BaseEventMapper._();

  static BaseEventMapper? _instance;
  static BaseEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BaseEventMapper._());
      JoinRoomMapper.ensureInitialized();
      ServerMessageMapper.ensureInitialized();
      ChatMessageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BaseEvent';

  @override
  final MappableFields<BaseEvent> fields = const {};

  static BaseEvent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'BaseEvent', 'eventType', '${data.value['eventType']}');
  }

  @override
  final Function instantiate = _instantiate;

  static BaseEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BaseEvent>(map);
  }

  static BaseEvent fromJson(String json) {
    return ensureInitialized().decodeJson<BaseEvent>(json);
  }
}

mixin BaseEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  BaseEventCopyWith<BaseEvent, BaseEvent, BaseEvent> get copyWith;
}

abstract class BaseEventCopyWith<$R, $In extends BaseEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  BaseEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class JoinRoomMapper extends SubClassMapperBase<JoinRoom> {
  JoinRoomMapper._();

  static JoinRoomMapper? _instance;
  static JoinRoomMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JoinRoomMapper._());
      BaseEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'JoinRoom';

  static String _$roomId(JoinRoom v) => v.roomId;
  static const Field<JoinRoom, String> _f$roomId = Field('roomId', _$roomId);

  @override
  final MappableFields<JoinRoom> fields = const {
    #roomId: _f$roomId,
  };

  @override
  final String discriminatorKey = 'eventType';
  @override
  final dynamic discriminatorValue = "JoinRoom";
  @override
  late final ClassMapperBase superMapper = BaseEventMapper.ensureInitialized();

  static JoinRoom _instantiate(DecodingData data) {
    return JoinRoom(roomId: data.dec(_f$roomId));
  }

  @override
  final Function instantiate = _instantiate;

  static JoinRoom fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JoinRoom>(map);
  }

  static JoinRoom fromJson(String json) {
    return ensureInitialized().decodeJson<JoinRoom>(json);
  }
}

mixin JoinRoomMappable {
  String toJson() {
    return JoinRoomMapper.ensureInitialized()
        .encodeJson<JoinRoom>(this as JoinRoom);
  }

  Map<String, dynamic> toMap() {
    return JoinRoomMapper.ensureInitialized()
        .encodeMap<JoinRoom>(this as JoinRoom);
  }

  JoinRoomCopyWith<JoinRoom, JoinRoom, JoinRoom> get copyWith =>
      _JoinRoomCopyWithImpl<JoinRoom, JoinRoom>(
          this as JoinRoom, $identity, $identity);
  @override
  String toString() {
    return JoinRoomMapper.ensureInitialized().stringifyValue(this as JoinRoom);
  }

  @override
  bool operator ==(Object other) {
    return JoinRoomMapper.ensureInitialized()
        .equalsValue(this as JoinRoom, other);
  }

  @override
  int get hashCode {
    return JoinRoomMapper.ensureInitialized().hashValue(this as JoinRoom);
  }
}

extension JoinRoomValueCopy<$R, $Out> on ObjectCopyWith<$R, JoinRoom, $Out> {
  JoinRoomCopyWith<$R, JoinRoom, $Out> get $asJoinRoom =>
      $base.as((v, t, t2) => _JoinRoomCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class JoinRoomCopyWith<$R, $In extends JoinRoom, $Out>
    implements BaseEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? roomId});
  JoinRoomCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _JoinRoomCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JoinRoom, $Out>
    implements JoinRoomCopyWith<$R, JoinRoom, $Out> {
  _JoinRoomCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JoinRoom> $mapper =
      JoinRoomMapper.ensureInitialized();
  @override
  $R call({String? roomId}) =>
      $apply(FieldCopyWithData({if (roomId != null) #roomId: roomId}));
  @override
  JoinRoom $make(CopyWithData data) =>
      JoinRoom(roomId: data.get(#roomId, or: $value.roomId));

  @override
  JoinRoomCopyWith<$R2, JoinRoom, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _JoinRoomCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ServerMessageMapper extends SubClassMapperBase<ServerMessage> {
  ServerMessageMapper._();

  static ServerMessageMapper? _instance;
  static ServerMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServerMessageMapper._());
      BaseEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ServerMessage';

  static String _$roomId(ServerMessage v) => v.roomId;
  static const Field<ServerMessage, String> _f$roomId =
      Field('roomId', _$roomId);
  static String _$message(ServerMessage v) => v.message;
  static const Field<ServerMessage, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<ServerMessage> fields = const {
    #roomId: _f$roomId,
    #message: _f$message,
  };

  @override
  final String discriminatorKey = 'eventType';
  @override
  final dynamic discriminatorValue = "ServerMessage";
  @override
  late final ClassMapperBase superMapper = BaseEventMapper.ensureInitialized();

  static ServerMessage _instantiate(DecodingData data) {
    return ServerMessage(
        roomId: data.dec(_f$roomId), message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static ServerMessage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ServerMessage>(map);
  }

  static ServerMessage fromJson(String json) {
    return ensureInitialized().decodeJson<ServerMessage>(json);
  }
}

mixin ServerMessageMappable {
  String toJson() {
    return ServerMessageMapper.ensureInitialized()
        .encodeJson<ServerMessage>(this as ServerMessage);
  }

  Map<String, dynamic> toMap() {
    return ServerMessageMapper.ensureInitialized()
        .encodeMap<ServerMessage>(this as ServerMessage);
  }

  ServerMessageCopyWith<ServerMessage, ServerMessage, ServerMessage>
      get copyWith => _ServerMessageCopyWithImpl<ServerMessage, ServerMessage>(
          this as ServerMessage, $identity, $identity);
  @override
  String toString() {
    return ServerMessageMapper.ensureInitialized()
        .stringifyValue(this as ServerMessage);
  }

  @override
  bool operator ==(Object other) {
    return ServerMessageMapper.ensureInitialized()
        .equalsValue(this as ServerMessage, other);
  }

  @override
  int get hashCode {
    return ServerMessageMapper.ensureInitialized()
        .hashValue(this as ServerMessage);
  }
}

extension ServerMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ServerMessage, $Out> {
  ServerMessageCopyWith<$R, ServerMessage, $Out> get $asServerMessage =>
      $base.as((v, t, t2) => _ServerMessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ServerMessageCopyWith<$R, $In extends ServerMessage, $Out>
    implements BaseEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? roomId, String? message});
  ServerMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ServerMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ServerMessage, $Out>
    implements ServerMessageCopyWith<$R, ServerMessage, $Out> {
  _ServerMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ServerMessage> $mapper =
      ServerMessageMapper.ensureInitialized();
  @override
  $R call({String? roomId, String? message}) => $apply(FieldCopyWithData({
        if (roomId != null) #roomId: roomId,
        if (message != null) #message: message
      }));
  @override
  ServerMessage $make(CopyWithData data) => ServerMessage(
      roomId: data.get(#roomId, or: $value.roomId),
      message: data.get(#message, or: $value.message));

  @override
  ServerMessageCopyWith<$R2, ServerMessage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ServerMessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChatMessageMapper extends SubClassMapperBase<ChatMessage> {
  ChatMessageMapper._();

  static ChatMessageMapper? _instance;
  static ChatMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatMessageMapper._());
      BaseEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ChatMessage';

  static String _$roomId(ChatMessage v) => v.roomId;
  static const Field<ChatMessage, String> _f$roomId = Field('roomId', _$roomId);
  static String _$message(ChatMessage v) => v.message;
  static const Field<ChatMessage, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<ChatMessage> fields = const {
    #roomId: _f$roomId,
    #message: _f$message,
  };

  @override
  final String discriminatorKey = 'eventType';
  @override
  final dynamic discriminatorValue = "ChatMessage";
  @override
  late final ClassMapperBase superMapper = BaseEventMapper.ensureInitialized();

  static ChatMessage _instantiate(DecodingData data) {
    return ChatMessage(
        roomId: data.dec(_f$roomId), message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static ChatMessage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatMessage>(map);
  }

  static ChatMessage fromJson(String json) {
    return ensureInitialized().decodeJson<ChatMessage>(json);
  }
}

mixin ChatMessageMappable {
  String toJson() {
    return ChatMessageMapper.ensureInitialized()
        .encodeJson<ChatMessage>(this as ChatMessage);
  }

  Map<String, dynamic> toMap() {
    return ChatMessageMapper.ensureInitialized()
        .encodeMap<ChatMessage>(this as ChatMessage);
  }

  ChatMessageCopyWith<ChatMessage, ChatMessage, ChatMessage> get copyWith =>
      _ChatMessageCopyWithImpl<ChatMessage, ChatMessage>(
          this as ChatMessage, $identity, $identity);
  @override
  String toString() {
    return ChatMessageMapper.ensureInitialized()
        .stringifyValue(this as ChatMessage);
  }

  @override
  bool operator ==(Object other) {
    return ChatMessageMapper.ensureInitialized()
        .equalsValue(this as ChatMessage, other);
  }

  @override
  int get hashCode {
    return ChatMessageMapper.ensureInitialized().hashValue(this as ChatMessage);
  }
}

extension ChatMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatMessage, $Out> {
  ChatMessageCopyWith<$R, ChatMessage, $Out> get $asChatMessage =>
      $base.as((v, t, t2) => _ChatMessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatMessageCopyWith<$R, $In extends ChatMessage, $Out>
    implements BaseEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? roomId, String? message});
  ChatMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatMessage, $Out>
    implements ChatMessageCopyWith<$R, ChatMessage, $Out> {
  _ChatMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatMessage> $mapper =
      ChatMessageMapper.ensureInitialized();
  @override
  $R call({String? roomId, String? message}) => $apply(FieldCopyWithData({
        if (roomId != null) #roomId: roomId,
        if (message != null) #message: message
      }));
  @override
  ChatMessage $make(CopyWithData data) => ChatMessage(
      roomId: data.get(#roomId, or: $value.roomId),
      message: data.get(#message, or: $value.message));

  @override
  ChatMessageCopyWith<$R2, ChatMessage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChatMessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
