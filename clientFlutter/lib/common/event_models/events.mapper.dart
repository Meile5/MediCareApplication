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
      JoinDoctorRoomMapper.ensureInitialized();
      BroadcastBookedSlotMapper.ensureInitialized();
      ServerMessageMapper.ensureInitialized();
      ChatMessageMapper.ensureInitialized();
      UnsubscribeFromChatMapper.ensureInitialized();
      DeviceVitalsMapper.ensureInitialized();
      SubscribeToVitalsMapper.ensureInitialized();
      SubscribeSuccessMapper.ensureInitialized();
      UnsubscribeFromVitalsMapper.ensureInitialized();
      UnsubscribeSuccessMapper.ensureInitialized();
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

class JoinDoctorRoomMapper extends SubClassMapperBase<JoinDoctorRoom> {
  JoinDoctorRoomMapper._();

  static JoinDoctorRoomMapper? _instance;
  static JoinDoctorRoomMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JoinDoctorRoomMapper._());
      BaseEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'JoinDoctorRoom';

  static String _$roomId(JoinDoctorRoom v) => v.roomId;
  static const Field<JoinDoctorRoom, String> _f$roomId =
      Field('roomId', _$roomId);

  @override
  final MappableFields<JoinDoctorRoom> fields = const {
    #roomId: _f$roomId,
  };

  @override
  final String discriminatorKey = 'eventType';
  @override
  final dynamic discriminatorValue = "JoinDoctorRoom";
  @override
  late final ClassMapperBase superMapper = BaseEventMapper.ensureInitialized();

  static JoinDoctorRoom _instantiate(DecodingData data) {
    return JoinDoctorRoom(roomId: data.dec(_f$roomId));
  }

  @override
  final Function instantiate = _instantiate;

  static JoinDoctorRoom fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JoinDoctorRoom>(map);
  }

  static JoinDoctorRoom fromJson(String json) {
    return ensureInitialized().decodeJson<JoinDoctorRoom>(json);
  }
}

mixin JoinDoctorRoomMappable {
  String toJson() {
    return JoinDoctorRoomMapper.ensureInitialized()
        .encodeJson<JoinDoctorRoom>(this as JoinDoctorRoom);
  }

  Map<String, dynamic> toMap() {
    return JoinDoctorRoomMapper.ensureInitialized()
        .encodeMap<JoinDoctorRoom>(this as JoinDoctorRoom);
  }

  JoinDoctorRoomCopyWith<JoinDoctorRoom, JoinDoctorRoom, JoinDoctorRoom>
      get copyWith =>
          _JoinDoctorRoomCopyWithImpl<JoinDoctorRoom, JoinDoctorRoom>(
              this as JoinDoctorRoom, $identity, $identity);
  @override
  String toString() {
    return JoinDoctorRoomMapper.ensureInitialized()
        .stringifyValue(this as JoinDoctorRoom);
  }

  @override
  bool operator ==(Object other) {
    return JoinDoctorRoomMapper.ensureInitialized()
        .equalsValue(this as JoinDoctorRoom, other);
  }

  @override
  int get hashCode {
    return JoinDoctorRoomMapper.ensureInitialized()
        .hashValue(this as JoinDoctorRoom);
  }
}

extension JoinDoctorRoomValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JoinDoctorRoom, $Out> {
  JoinDoctorRoomCopyWith<$R, JoinDoctorRoom, $Out> get $asJoinDoctorRoom =>
      $base.as((v, t, t2) => _JoinDoctorRoomCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class JoinDoctorRoomCopyWith<$R, $In extends JoinDoctorRoom, $Out>
    implements BaseEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? roomId});
  JoinDoctorRoomCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _JoinDoctorRoomCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JoinDoctorRoom, $Out>
    implements JoinDoctorRoomCopyWith<$R, JoinDoctorRoom, $Out> {
  _JoinDoctorRoomCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JoinDoctorRoom> $mapper =
      JoinDoctorRoomMapper.ensureInitialized();
  @override
  $R call({String? roomId}) =>
      $apply(FieldCopyWithData({if (roomId != null) #roomId: roomId}));
  @override
  JoinDoctorRoom $make(CopyWithData data) =>
      JoinDoctorRoom(roomId: data.get(#roomId, or: $value.roomId));

  @override
  JoinDoctorRoomCopyWith<$R2, JoinDoctorRoom, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _JoinDoctorRoomCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BroadcastBookedSlotMapper
    extends SubClassMapperBase<BroadcastBookedSlot> {
  BroadcastBookedSlotMapper._();

  static BroadcastBookedSlotMapper? _instance;
  static BroadcastBookedSlotMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BroadcastBookedSlotMapper._());
      BaseEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'BroadcastBookedSlot';

  static String _$id(BroadcastBookedSlot v) => v.id;
  static const Field<BroadcastBookedSlot, String> _f$id = Field('id', _$id);

  @override
  final MappableFields<BroadcastBookedSlot> fields = const {
    #id: _f$id,
  };

  @override
  final String discriminatorKey = 'eventType';
  @override
  final dynamic discriminatorValue = "BroadcastBookedSlot";
  @override
  late final ClassMapperBase superMapper = BaseEventMapper.ensureInitialized();

  static BroadcastBookedSlot _instantiate(DecodingData data) {
    return BroadcastBookedSlot(id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static BroadcastBookedSlot fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BroadcastBookedSlot>(map);
  }

  static BroadcastBookedSlot fromJson(String json) {
    return ensureInitialized().decodeJson<BroadcastBookedSlot>(json);
  }
}

mixin BroadcastBookedSlotMappable {
  String toJson() {
    return BroadcastBookedSlotMapper.ensureInitialized()
        .encodeJson<BroadcastBookedSlot>(this as BroadcastBookedSlot);
  }

  Map<String, dynamic> toMap() {
    return BroadcastBookedSlotMapper.ensureInitialized()
        .encodeMap<BroadcastBookedSlot>(this as BroadcastBookedSlot);
  }

  BroadcastBookedSlotCopyWith<BroadcastBookedSlot, BroadcastBookedSlot,
      BroadcastBookedSlot> get copyWith => _BroadcastBookedSlotCopyWithImpl<
          BroadcastBookedSlot, BroadcastBookedSlot>(
      this as BroadcastBookedSlot, $identity, $identity);
  @override
  String toString() {
    return BroadcastBookedSlotMapper.ensureInitialized()
        .stringifyValue(this as BroadcastBookedSlot);
  }

  @override
  bool operator ==(Object other) {
    return BroadcastBookedSlotMapper.ensureInitialized()
        .equalsValue(this as BroadcastBookedSlot, other);
  }

  @override
  int get hashCode {
    return BroadcastBookedSlotMapper.ensureInitialized()
        .hashValue(this as BroadcastBookedSlot);
  }
}

extension BroadcastBookedSlotValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BroadcastBookedSlot, $Out> {
  BroadcastBookedSlotCopyWith<$R, BroadcastBookedSlot, $Out>
      get $asBroadcastBookedSlot => $base.as(
          (v, t, t2) => _BroadcastBookedSlotCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BroadcastBookedSlotCopyWith<$R, $In extends BroadcastBookedSlot,
    $Out> implements BaseEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id});
  BroadcastBookedSlotCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BroadcastBookedSlotCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BroadcastBookedSlot, $Out>
    implements BroadcastBookedSlotCopyWith<$R, BroadcastBookedSlot, $Out> {
  _BroadcastBookedSlotCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BroadcastBookedSlot> $mapper =
      BroadcastBookedSlotMapper.ensureInitialized();
  @override
  $R call({String? id}) => $apply(FieldCopyWithData({if (id != null) #id: id}));
  @override
  BroadcastBookedSlot $make(CopyWithData data) =>
      BroadcastBookedSlot(id: data.get(#id, or: $value.id));

  @override
  BroadcastBookedSlotCopyWith<$R2, BroadcastBookedSlot, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _BroadcastBookedSlotCopyWithImpl<$R2, $Out2>($value, $cast, t);
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
  static String _$userId(ChatMessage v) => v.userId;
  static const Field<ChatMessage, String> _f$userId = Field('userId', _$userId);
  static String _$name(ChatMessage v) => v.name;
  static const Field<ChatMessage, String> _f$name = Field('name', _$name);
  static String _$message(ChatMessage v) => v.message;
  static const Field<ChatMessage, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<ChatMessage> fields = const {
    #roomId: _f$roomId,
    #userId: _f$userId,
    #name: _f$name,
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
        roomId: data.dec(_f$roomId),
        userId: data.dec(_f$userId),
        name: data.dec(_f$name),
        message: data.dec(_f$message));
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
  $R call({String? roomId, String? userId, String? name, String? message});
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
  $R call({String? roomId, String? userId, String? name, String? message}) =>
      $apply(FieldCopyWithData({
        if (roomId != null) #roomId: roomId,
        if (userId != null) #userId: userId,
        if (name != null) #name: name,
        if (message != null) #message: message
      }));
  @override
  ChatMessage $make(CopyWithData data) => ChatMessage(
      roomId: data.get(#roomId, or: $value.roomId),
      userId: data.get(#userId, or: $value.userId),
      name: data.get(#name, or: $value.name),
      message: data.get(#message, or: $value.message));

  @override
  ChatMessageCopyWith<$R2, ChatMessage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChatMessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UnsubscribeFromChatMapper
    extends SubClassMapperBase<UnsubscribeFromChat> {
  UnsubscribeFromChatMapper._();

  static UnsubscribeFromChatMapper? _instance;
  static UnsubscribeFromChatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UnsubscribeFromChatMapper._());
      BaseEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'UnsubscribeFromChat';

  static String _$roomId(UnsubscribeFromChat v) => v.roomId;
  static const Field<UnsubscribeFromChat, String> _f$roomId =
      Field('roomId', _$roomId);

  @override
  final MappableFields<UnsubscribeFromChat> fields = const {
    #roomId: _f$roomId,
  };

  @override
  final String discriminatorKey = 'eventType';
  @override
  final dynamic discriminatorValue = "UnsubscribeFromChat";
  @override
  late final ClassMapperBase superMapper = BaseEventMapper.ensureInitialized();

  static UnsubscribeFromChat _instantiate(DecodingData data) {
    return UnsubscribeFromChat(roomId: data.dec(_f$roomId));
  }

  @override
  final Function instantiate = _instantiate;

  static UnsubscribeFromChat fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UnsubscribeFromChat>(map);
  }

  static UnsubscribeFromChat fromJson(String json) {
    return ensureInitialized().decodeJson<UnsubscribeFromChat>(json);
  }
}

mixin UnsubscribeFromChatMappable {
  String toJson() {
    return UnsubscribeFromChatMapper.ensureInitialized()
        .encodeJson<UnsubscribeFromChat>(this as UnsubscribeFromChat);
  }

  Map<String, dynamic> toMap() {
    return UnsubscribeFromChatMapper.ensureInitialized()
        .encodeMap<UnsubscribeFromChat>(this as UnsubscribeFromChat);
  }

  UnsubscribeFromChatCopyWith<UnsubscribeFromChat, UnsubscribeFromChat,
      UnsubscribeFromChat> get copyWith => _UnsubscribeFromChatCopyWithImpl<
          UnsubscribeFromChat, UnsubscribeFromChat>(
      this as UnsubscribeFromChat, $identity, $identity);
  @override
  String toString() {
    return UnsubscribeFromChatMapper.ensureInitialized()
        .stringifyValue(this as UnsubscribeFromChat);
  }

  @override
  bool operator ==(Object other) {
    return UnsubscribeFromChatMapper.ensureInitialized()
        .equalsValue(this as UnsubscribeFromChat, other);
  }

  @override
  int get hashCode {
    return UnsubscribeFromChatMapper.ensureInitialized()
        .hashValue(this as UnsubscribeFromChat);
  }
}

extension UnsubscribeFromChatValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UnsubscribeFromChat, $Out> {
  UnsubscribeFromChatCopyWith<$R, UnsubscribeFromChat, $Out>
      get $asUnsubscribeFromChat => $base.as(
          (v, t, t2) => _UnsubscribeFromChatCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UnsubscribeFromChatCopyWith<$R, $In extends UnsubscribeFromChat,
    $Out> implements BaseEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? roomId});
  UnsubscribeFromChatCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UnsubscribeFromChatCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UnsubscribeFromChat, $Out>
    implements UnsubscribeFromChatCopyWith<$R, UnsubscribeFromChat, $Out> {
  _UnsubscribeFromChatCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UnsubscribeFromChat> $mapper =
      UnsubscribeFromChatMapper.ensureInitialized();
  @override
  $R call({String? roomId}) =>
      $apply(FieldCopyWithData({if (roomId != null) #roomId: roomId}));
  @override
  UnsubscribeFromChat $make(CopyWithData data) =>
      UnsubscribeFromChat(roomId: data.get(#roomId, or: $value.roomId));

  @override
  UnsubscribeFromChatCopyWith<$R2, UnsubscribeFromChat, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UnsubscribeFromChatCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DeviceVitalsMapper extends SubClassMapperBase<DeviceVitals> {
  DeviceVitalsMapper._();

  static DeviceVitalsMapper? _instance;
  static DeviceVitalsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeviceVitalsMapper._());
      BaseEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'DeviceVitals';

  static String _$userId(DeviceVitals v) => v.userId;
  static const Field<DeviceVitals, String> _f$userId =
      Field('userId', _$userId);
  static String _$deviceId(DeviceVitals v) => v.deviceId;
  static const Field<DeviceVitals, String> _f$deviceId =
      Field('deviceId', _$deviceId);
  static double _$temperature(DeviceVitals v) => v.temperature;
  static const Field<DeviceVitals, double> _f$temperature =
      Field('temperature', _$temperature);
  static List<int> _$ecg(DeviceVitals v) => v.ecg;
  static const Field<DeviceVitals, List<int>> _f$ecg = Field('ecg', _$ecg);

  @override
  final MappableFields<DeviceVitals> fields = const {
    #userId: _f$userId,
    #deviceId: _f$deviceId,
    #temperature: _f$temperature,
    #ecg: _f$ecg,
  };

  @override
  final String discriminatorKey = 'eventType';
  @override
  final dynamic discriminatorValue = "DeviceVitals";
  @override
  late final ClassMapperBase superMapper = BaseEventMapper.ensureInitialized();

  static DeviceVitals _instantiate(DecodingData data) {
    return DeviceVitals(
        userId: data.dec(_f$userId),
        deviceId: data.dec(_f$deviceId),
        temperature: data.dec(_f$temperature),
        ecg: data.dec(_f$ecg));
  }

  @override
  final Function instantiate = _instantiate;

  static DeviceVitals fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DeviceVitals>(map);
  }

  static DeviceVitals fromJson(String json) {
    return ensureInitialized().decodeJson<DeviceVitals>(json);
  }
}

mixin DeviceVitalsMappable {
  String toJson() {
    return DeviceVitalsMapper.ensureInitialized()
        .encodeJson<DeviceVitals>(this as DeviceVitals);
  }

  Map<String, dynamic> toMap() {
    return DeviceVitalsMapper.ensureInitialized()
        .encodeMap<DeviceVitals>(this as DeviceVitals);
  }

  DeviceVitalsCopyWith<DeviceVitals, DeviceVitals, DeviceVitals> get copyWith =>
      _DeviceVitalsCopyWithImpl<DeviceVitals, DeviceVitals>(
          this as DeviceVitals, $identity, $identity);
  @override
  String toString() {
    return DeviceVitalsMapper.ensureInitialized()
        .stringifyValue(this as DeviceVitals);
  }

  @override
  bool operator ==(Object other) {
    return DeviceVitalsMapper.ensureInitialized()
        .equalsValue(this as DeviceVitals, other);
  }

  @override
  int get hashCode {
    return DeviceVitalsMapper.ensureInitialized()
        .hashValue(this as DeviceVitals);
  }
}

extension DeviceVitalsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DeviceVitals, $Out> {
  DeviceVitalsCopyWith<$R, DeviceVitals, $Out> get $asDeviceVitals =>
      $base.as((v, t, t2) => _DeviceVitalsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DeviceVitalsCopyWith<$R, $In extends DeviceVitals, $Out>
    implements BaseEventCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get ecg;
  @override
  $R call(
      {String? userId, String? deviceId, double? temperature, List<int>? ecg});
  DeviceVitalsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DeviceVitalsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DeviceVitals, $Out>
    implements DeviceVitalsCopyWith<$R, DeviceVitals, $Out> {
  _DeviceVitalsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DeviceVitals> $mapper =
      DeviceVitalsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get ecg => ListCopyWith(
      $value.ecg,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(ecg: v));
  @override
  $R call(
          {String? userId,
          String? deviceId,
          double? temperature,
          List<int>? ecg}) =>
      $apply(FieldCopyWithData({
        if (userId != null) #userId: userId,
        if (deviceId != null) #deviceId: deviceId,
        if (temperature != null) #temperature: temperature,
        if (ecg != null) #ecg: ecg
      }));
  @override
  DeviceVitals $make(CopyWithData data) => DeviceVitals(
      userId: data.get(#userId, or: $value.userId),
      deviceId: data.get(#deviceId, or: $value.deviceId),
      temperature: data.get(#temperature, or: $value.temperature),
      ecg: data.get(#ecg, or: $value.ecg));

  @override
  DeviceVitalsCopyWith<$R2, DeviceVitals, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DeviceVitalsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubscribeToVitalsMapper extends SubClassMapperBase<SubscribeToVitals> {
  SubscribeToVitalsMapper._();

  static SubscribeToVitalsMapper? _instance;
  static SubscribeToVitalsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubscribeToVitalsMapper._());
      BaseEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SubscribeToVitals';

  static String _$deviceId(SubscribeToVitals v) => v.deviceId;
  static const Field<SubscribeToVitals, String> _f$deviceId =
      Field('deviceId', _$deviceId);

  @override
  final MappableFields<SubscribeToVitals> fields = const {
    #deviceId: _f$deviceId,
  };

  @override
  final String discriminatorKey = 'eventType';
  @override
  final dynamic discriminatorValue = "SubscribeToVitals";
  @override
  late final ClassMapperBase superMapper = BaseEventMapper.ensureInitialized();

  static SubscribeToVitals _instantiate(DecodingData data) {
    return SubscribeToVitals(deviceId: data.dec(_f$deviceId));
  }

  @override
  final Function instantiate = _instantiate;

  static SubscribeToVitals fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubscribeToVitals>(map);
  }

  static SubscribeToVitals fromJson(String json) {
    return ensureInitialized().decodeJson<SubscribeToVitals>(json);
  }
}

mixin SubscribeToVitalsMappable {
  String toJson() {
    return SubscribeToVitalsMapper.ensureInitialized()
        .encodeJson<SubscribeToVitals>(this as SubscribeToVitals);
  }

  Map<String, dynamic> toMap() {
    return SubscribeToVitalsMapper.ensureInitialized()
        .encodeMap<SubscribeToVitals>(this as SubscribeToVitals);
  }

  SubscribeToVitalsCopyWith<SubscribeToVitals, SubscribeToVitals,
          SubscribeToVitals>
      get copyWith =>
          _SubscribeToVitalsCopyWithImpl<SubscribeToVitals, SubscribeToVitals>(
              this as SubscribeToVitals, $identity, $identity);
  @override
  String toString() {
    return SubscribeToVitalsMapper.ensureInitialized()
        .stringifyValue(this as SubscribeToVitals);
  }

  @override
  bool operator ==(Object other) {
    return SubscribeToVitalsMapper.ensureInitialized()
        .equalsValue(this as SubscribeToVitals, other);
  }

  @override
  int get hashCode {
    return SubscribeToVitalsMapper.ensureInitialized()
        .hashValue(this as SubscribeToVitals);
  }
}

extension SubscribeToVitalsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubscribeToVitals, $Out> {
  SubscribeToVitalsCopyWith<$R, SubscribeToVitals, $Out>
      get $asSubscribeToVitals => $base
          .as((v, t, t2) => _SubscribeToVitalsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubscribeToVitalsCopyWith<$R, $In extends SubscribeToVitals,
    $Out> implements BaseEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? deviceId});
  SubscribeToVitalsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubscribeToVitalsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubscribeToVitals, $Out>
    implements SubscribeToVitalsCopyWith<$R, SubscribeToVitals, $Out> {
  _SubscribeToVitalsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubscribeToVitals> $mapper =
      SubscribeToVitalsMapper.ensureInitialized();
  @override
  $R call({String? deviceId}) =>
      $apply(FieldCopyWithData({if (deviceId != null) #deviceId: deviceId}));
  @override
  SubscribeToVitals $make(CopyWithData data) =>
      SubscribeToVitals(deviceId: data.get(#deviceId, or: $value.deviceId));

  @override
  SubscribeToVitalsCopyWith<$R2, SubscribeToVitals, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SubscribeToVitalsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubscribeSuccessMapper extends SubClassMapperBase<SubscribeSuccess> {
  SubscribeSuccessMapper._();

  static SubscribeSuccessMapper? _instance;
  static SubscribeSuccessMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubscribeSuccessMapper._());
      BaseEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SubscribeSuccess';

  static String _$message(SubscribeSuccess v) => v.message;
  static const Field<SubscribeSuccess, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<SubscribeSuccess> fields = const {
    #message: _f$message,
  };

  @override
  final String discriminatorKey = 'eventType';
  @override
  final dynamic discriminatorValue = "SubscribeSuccess";
  @override
  late final ClassMapperBase superMapper = BaseEventMapper.ensureInitialized();

  static SubscribeSuccess _instantiate(DecodingData data) {
    return SubscribeSuccess(message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static SubscribeSuccess fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubscribeSuccess>(map);
  }

  static SubscribeSuccess fromJson(String json) {
    return ensureInitialized().decodeJson<SubscribeSuccess>(json);
  }
}

mixin SubscribeSuccessMappable {
  String toJson() {
    return SubscribeSuccessMapper.ensureInitialized()
        .encodeJson<SubscribeSuccess>(this as SubscribeSuccess);
  }

  Map<String, dynamic> toMap() {
    return SubscribeSuccessMapper.ensureInitialized()
        .encodeMap<SubscribeSuccess>(this as SubscribeSuccess);
  }

  SubscribeSuccessCopyWith<SubscribeSuccess, SubscribeSuccess, SubscribeSuccess>
      get copyWith =>
          _SubscribeSuccessCopyWithImpl<SubscribeSuccess, SubscribeSuccess>(
              this as SubscribeSuccess, $identity, $identity);
  @override
  String toString() {
    return SubscribeSuccessMapper.ensureInitialized()
        .stringifyValue(this as SubscribeSuccess);
  }

  @override
  bool operator ==(Object other) {
    return SubscribeSuccessMapper.ensureInitialized()
        .equalsValue(this as SubscribeSuccess, other);
  }

  @override
  int get hashCode {
    return SubscribeSuccessMapper.ensureInitialized()
        .hashValue(this as SubscribeSuccess);
  }
}

extension SubscribeSuccessValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubscribeSuccess, $Out> {
  SubscribeSuccessCopyWith<$R, SubscribeSuccess, $Out>
      get $asSubscribeSuccess => $base
          .as((v, t, t2) => _SubscribeSuccessCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubscribeSuccessCopyWith<$R, $In extends SubscribeSuccess, $Out>
    implements BaseEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  SubscribeSuccessCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubscribeSuccessCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubscribeSuccess, $Out>
    implements SubscribeSuccessCopyWith<$R, SubscribeSuccess, $Out> {
  _SubscribeSuccessCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubscribeSuccess> $mapper =
      SubscribeSuccessMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  SubscribeSuccess $make(CopyWithData data) =>
      SubscribeSuccess(message: data.get(#message, or: $value.message));

  @override
  SubscribeSuccessCopyWith<$R2, SubscribeSuccess, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SubscribeSuccessCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UnsubscribeFromVitalsMapper
    extends SubClassMapperBase<UnsubscribeFromVitals> {
  UnsubscribeFromVitalsMapper._();

  static UnsubscribeFromVitalsMapper? _instance;
  static UnsubscribeFromVitalsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UnsubscribeFromVitalsMapper._());
      BaseEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'UnsubscribeFromVitals';

  static String _$deviceId(UnsubscribeFromVitals v) => v.deviceId;
  static const Field<UnsubscribeFromVitals, String> _f$deviceId =
      Field('deviceId', _$deviceId);

  @override
  final MappableFields<UnsubscribeFromVitals> fields = const {
    #deviceId: _f$deviceId,
  };

  @override
  final String discriminatorKey = 'eventType';
  @override
  final dynamic discriminatorValue = "UnsubscribeFromVitals";
  @override
  late final ClassMapperBase superMapper = BaseEventMapper.ensureInitialized();

  static UnsubscribeFromVitals _instantiate(DecodingData data) {
    return UnsubscribeFromVitals(deviceId: data.dec(_f$deviceId));
  }

  @override
  final Function instantiate = _instantiate;

  static UnsubscribeFromVitals fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UnsubscribeFromVitals>(map);
  }

  static UnsubscribeFromVitals fromJson(String json) {
    return ensureInitialized().decodeJson<UnsubscribeFromVitals>(json);
  }
}

mixin UnsubscribeFromVitalsMappable {
  String toJson() {
    return UnsubscribeFromVitalsMapper.ensureInitialized()
        .encodeJson<UnsubscribeFromVitals>(this as UnsubscribeFromVitals);
  }

  Map<String, dynamic> toMap() {
    return UnsubscribeFromVitalsMapper.ensureInitialized()
        .encodeMap<UnsubscribeFromVitals>(this as UnsubscribeFromVitals);
  }

  UnsubscribeFromVitalsCopyWith<UnsubscribeFromVitals, UnsubscribeFromVitals,
      UnsubscribeFromVitals> get copyWith => _UnsubscribeFromVitalsCopyWithImpl<
          UnsubscribeFromVitals, UnsubscribeFromVitals>(
      this as UnsubscribeFromVitals, $identity, $identity);
  @override
  String toString() {
    return UnsubscribeFromVitalsMapper.ensureInitialized()
        .stringifyValue(this as UnsubscribeFromVitals);
  }

  @override
  bool operator ==(Object other) {
    return UnsubscribeFromVitalsMapper.ensureInitialized()
        .equalsValue(this as UnsubscribeFromVitals, other);
  }

  @override
  int get hashCode {
    return UnsubscribeFromVitalsMapper.ensureInitialized()
        .hashValue(this as UnsubscribeFromVitals);
  }
}

extension UnsubscribeFromVitalsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UnsubscribeFromVitals, $Out> {
  UnsubscribeFromVitalsCopyWith<$R, UnsubscribeFromVitals, $Out>
      get $asUnsubscribeFromVitals => $base.as(
          (v, t, t2) => _UnsubscribeFromVitalsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UnsubscribeFromVitalsCopyWith<
    $R,
    $In extends UnsubscribeFromVitals,
    $Out> implements BaseEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? deviceId});
  UnsubscribeFromVitalsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UnsubscribeFromVitalsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UnsubscribeFromVitals, $Out>
    implements UnsubscribeFromVitalsCopyWith<$R, UnsubscribeFromVitals, $Out> {
  _UnsubscribeFromVitalsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UnsubscribeFromVitals> $mapper =
      UnsubscribeFromVitalsMapper.ensureInitialized();
  @override
  $R call({String? deviceId}) =>
      $apply(FieldCopyWithData({if (deviceId != null) #deviceId: deviceId}));
  @override
  UnsubscribeFromVitals $make(CopyWithData data) =>
      UnsubscribeFromVitals(deviceId: data.get(#deviceId, or: $value.deviceId));

  @override
  UnsubscribeFromVitalsCopyWith<$R2, UnsubscribeFromVitals, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UnsubscribeFromVitalsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UnsubscribeSuccessMapper extends SubClassMapperBase<UnsubscribeSuccess> {
  UnsubscribeSuccessMapper._();

  static UnsubscribeSuccessMapper? _instance;
  static UnsubscribeSuccessMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UnsubscribeSuccessMapper._());
      BaseEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'UnsubscribeSuccess';

  static String _$message(UnsubscribeSuccess v) => v.message;
  static const Field<UnsubscribeSuccess, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<UnsubscribeSuccess> fields = const {
    #message: _f$message,
  };

  @override
  final String discriminatorKey = 'eventType';
  @override
  final dynamic discriminatorValue = "UnsubscribeSuccess";
  @override
  late final ClassMapperBase superMapper = BaseEventMapper.ensureInitialized();

  static UnsubscribeSuccess _instantiate(DecodingData data) {
    return UnsubscribeSuccess(message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static UnsubscribeSuccess fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UnsubscribeSuccess>(map);
  }

  static UnsubscribeSuccess fromJson(String json) {
    return ensureInitialized().decodeJson<UnsubscribeSuccess>(json);
  }
}

mixin UnsubscribeSuccessMappable {
  String toJson() {
    return UnsubscribeSuccessMapper.ensureInitialized()
        .encodeJson<UnsubscribeSuccess>(this as UnsubscribeSuccess);
  }

  Map<String, dynamic> toMap() {
    return UnsubscribeSuccessMapper.ensureInitialized()
        .encodeMap<UnsubscribeSuccess>(this as UnsubscribeSuccess);
  }

  UnsubscribeSuccessCopyWith<UnsubscribeSuccess, UnsubscribeSuccess,
          UnsubscribeSuccess>
      get copyWith => _UnsubscribeSuccessCopyWithImpl<UnsubscribeSuccess,
          UnsubscribeSuccess>(this as UnsubscribeSuccess, $identity, $identity);
  @override
  String toString() {
    return UnsubscribeSuccessMapper.ensureInitialized()
        .stringifyValue(this as UnsubscribeSuccess);
  }

  @override
  bool operator ==(Object other) {
    return UnsubscribeSuccessMapper.ensureInitialized()
        .equalsValue(this as UnsubscribeSuccess, other);
  }

  @override
  int get hashCode {
    return UnsubscribeSuccessMapper.ensureInitialized()
        .hashValue(this as UnsubscribeSuccess);
  }
}

extension UnsubscribeSuccessValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UnsubscribeSuccess, $Out> {
  UnsubscribeSuccessCopyWith<$R, UnsubscribeSuccess, $Out>
      get $asUnsubscribeSuccess => $base.as(
          (v, t, t2) => _UnsubscribeSuccessCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UnsubscribeSuccessCopyWith<$R, $In extends UnsubscribeSuccess,
    $Out> implements BaseEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  UnsubscribeSuccessCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UnsubscribeSuccessCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UnsubscribeSuccess, $Out>
    implements UnsubscribeSuccessCopyWith<$R, UnsubscribeSuccess, $Out> {
  _UnsubscribeSuccessCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UnsubscribeSuccess> $mapper =
      UnsubscribeSuccessMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  UnsubscribeSuccess $make(CopyWithData data) =>
      UnsubscribeSuccess(message: data.get(#message, or: $value.message));

  @override
  UnsubscribeSuccessCopyWith<$R2, UnsubscribeSuccess, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UnsubscribeSuccessCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
