// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'models_for_mapping.dart';

class BookAppointmentDtoMapper extends ClassMapperBase<BookAppointmentDto> {
  BookAppointmentDtoMapper._();

  static BookAppointmentDtoMapper? _instance;
  static BookAppointmentDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BookAppointmentDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BookAppointmentDto';

  static DateTime _$startTime(BookAppointmentDto v) => v.startTime;
  static const Field<BookAppointmentDto, DateTime> _f$startTime =
      Field('startTime', _$startTime);
  static DateTime _$endTime(BookAppointmentDto v) => v.endTime;
  static const Field<BookAppointmentDto, DateTime> _f$endTime =
      Field('endTime', _$endTime);
  static String _$patientId(BookAppointmentDto v) => v.patientId;
  static const Field<BookAppointmentDto, String> _f$patientId =
      Field('patientId', _$patientId);
  static String _$doctorId(BookAppointmentDto v) => v.doctorId;
  static const Field<BookAppointmentDto, String> _f$doctorId =
      Field('doctorId', _$doctorId);

  @override
  final MappableFields<BookAppointmentDto> fields = const {
    #startTime: _f$startTime,
    #endTime: _f$endTime,
    #patientId: _f$patientId,
    #doctorId: _f$doctorId,
  };

  static BookAppointmentDto _instantiate(DecodingData data) {
    return BookAppointmentDto(
        startTime: data.dec(_f$startTime),
        endTime: data.dec(_f$endTime),
        patientId: data.dec(_f$patientId),
        doctorId: data.dec(_f$doctorId));
  }

  @override
  final Function instantiate = _instantiate;

  static BookAppointmentDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BookAppointmentDto>(map);
  }

  static BookAppointmentDto fromJson(String json) {
    return ensureInitialized().decodeJson<BookAppointmentDto>(json);
  }
}

mixin BookAppointmentDtoMappable {
  String toJson() {
    return BookAppointmentDtoMapper.ensureInitialized()
        .encodeJson<BookAppointmentDto>(this as BookAppointmentDto);
  }

  Map<String, dynamic> toMap() {
    return BookAppointmentDtoMapper.ensureInitialized()
        .encodeMap<BookAppointmentDto>(this as BookAppointmentDto);
  }

  BookAppointmentDtoCopyWith<BookAppointmentDto, BookAppointmentDto,
          BookAppointmentDto>
      get copyWith => _BookAppointmentDtoCopyWithImpl<BookAppointmentDto,
          BookAppointmentDto>(this as BookAppointmentDto, $identity, $identity);
  @override
  String toString() {
    return BookAppointmentDtoMapper.ensureInitialized()
        .stringifyValue(this as BookAppointmentDto);
  }

  @override
  bool operator ==(Object other) {
    return BookAppointmentDtoMapper.ensureInitialized()
        .equalsValue(this as BookAppointmentDto, other);
  }

  @override
  int get hashCode {
    return BookAppointmentDtoMapper.ensureInitialized()
        .hashValue(this as BookAppointmentDto);
  }
}

extension BookAppointmentDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BookAppointmentDto, $Out> {
  BookAppointmentDtoCopyWith<$R, BookAppointmentDto, $Out>
      get $asBookAppointmentDto => $base.as(
          (v, t, t2) => _BookAppointmentDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BookAppointmentDtoCopyWith<$R, $In extends BookAppointmentDto,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {DateTime? startTime,
      DateTime? endTime,
      String? patientId,
      String? doctorId});
  BookAppointmentDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BookAppointmentDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BookAppointmentDto, $Out>
    implements BookAppointmentDtoCopyWith<$R, BookAppointmentDto, $Out> {
  _BookAppointmentDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BookAppointmentDto> $mapper =
      BookAppointmentDtoMapper.ensureInitialized();
  @override
  $R call(
          {DateTime? startTime,
          DateTime? endTime,
          String? patientId,
          String? doctorId}) =>
      $apply(FieldCopyWithData({
        if (startTime != null) #startTime: startTime,
        if (endTime != null) #endTime: endTime,
        if (patientId != null) #patientId: patientId,
        if (doctorId != null) #doctorId: doctorId
      }));
  @override
  BookAppointmentDto $make(CopyWithData data) => BookAppointmentDto(
      startTime: data.get(#startTime, or: $value.startTime),
      endTime: data.get(#endTime, or: $value.endTime),
      patientId: data.get(#patientId, or: $value.patientId),
      doctorId: data.get(#doctorId, or: $value.doctorId));

  @override
  BookAppointmentDtoCopyWith<$R2, BookAppointmentDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BookAppointmentDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FutureAppointmentsDtoMapper
    extends ClassMapperBase<FutureAppointmentsDto> {
  FutureAppointmentsDtoMapper._();

  static FutureAppointmentsDtoMapper? _instance;
  static FutureAppointmentsDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FutureAppointmentsDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FutureAppointmentsDto';

  static String _$id(FutureAppointmentsDto v) => v.id;
  static const Field<FutureAppointmentsDto, String> _f$id = Field('id', _$id);
  static DateTime _$startTime(FutureAppointmentsDto v) => v.startTime;
  static const Field<FutureAppointmentsDto, DateTime> _f$startTime =
      Field('startTime', _$startTime);
  static DateTime _$endTime(FutureAppointmentsDto v) => v.endTime;
  static const Field<FutureAppointmentsDto, DateTime> _f$endTime =
      Field('endTime', _$endTime);
  static String _$status(FutureAppointmentsDto v) => v.status;
  static const Field<FutureAppointmentsDto, String> _f$status =
      Field('status', _$status);

  @override
  final MappableFields<FutureAppointmentsDto> fields = const {
    #id: _f$id,
    #startTime: _f$startTime,
    #endTime: _f$endTime,
    #status: _f$status,
  };

  static FutureAppointmentsDto _instantiate(DecodingData data) {
    return FutureAppointmentsDto(
        id: data.dec(_f$id),
        startTime: data.dec(_f$startTime),
        endTime: data.dec(_f$endTime),
        status: data.dec(_f$status));
  }

  @override
  final Function instantiate = _instantiate;

  static FutureAppointmentsDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FutureAppointmentsDto>(map);
  }

  static FutureAppointmentsDto fromJson(String json) {
    return ensureInitialized().decodeJson<FutureAppointmentsDto>(json);
  }
}

mixin FutureAppointmentsDtoMappable {
  String toJson() {
    return FutureAppointmentsDtoMapper.ensureInitialized()
        .encodeJson<FutureAppointmentsDto>(this as FutureAppointmentsDto);
  }

  Map<String, dynamic> toMap() {
    return FutureAppointmentsDtoMapper.ensureInitialized()
        .encodeMap<FutureAppointmentsDto>(this as FutureAppointmentsDto);
  }

  FutureAppointmentsDtoCopyWith<FutureAppointmentsDto, FutureAppointmentsDto,
      FutureAppointmentsDto> get copyWith => _FutureAppointmentsDtoCopyWithImpl<
          FutureAppointmentsDto, FutureAppointmentsDto>(
      this as FutureAppointmentsDto, $identity, $identity);
  @override
  String toString() {
    return FutureAppointmentsDtoMapper.ensureInitialized()
        .stringifyValue(this as FutureAppointmentsDto);
  }

  @override
  bool operator ==(Object other) {
    return FutureAppointmentsDtoMapper.ensureInitialized()
        .equalsValue(this as FutureAppointmentsDto, other);
  }

  @override
  int get hashCode {
    return FutureAppointmentsDtoMapper.ensureInitialized()
        .hashValue(this as FutureAppointmentsDto);
  }
}

extension FutureAppointmentsDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FutureAppointmentsDto, $Out> {
  FutureAppointmentsDtoCopyWith<$R, FutureAppointmentsDto, $Out>
      get $asFutureAppointmentsDto => $base.as(
          (v, t, t2) => _FutureAppointmentsDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FutureAppointmentsDtoCopyWith<
    $R,
    $In extends FutureAppointmentsDto,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, DateTime? startTime, DateTime? endTime, String? status});
  FutureAppointmentsDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FutureAppointmentsDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FutureAppointmentsDto, $Out>
    implements FutureAppointmentsDtoCopyWith<$R, FutureAppointmentsDto, $Out> {
  _FutureAppointmentsDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FutureAppointmentsDto> $mapper =
      FutureAppointmentsDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? startTime,
          DateTime? endTime,
          String? status}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (startTime != null) #startTime: startTime,
        if (endTime != null) #endTime: endTime,
        if (status != null) #status: status
      }));
  @override
  FutureAppointmentsDto $make(CopyWithData data) => FutureAppointmentsDto(
      id: data.get(#id, or: $value.id),
      startTime: data.get(#startTime, or: $value.startTime),
      endTime: data.get(#endTime, or: $value.endTime),
      status: data.get(#status, or: $value.status));

  @override
  FutureAppointmentsDtoCopyWith<$R2, FutureAppointmentsDto, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FutureAppointmentsDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PastAppointmentsDtoMapper extends ClassMapperBase<PastAppointmentsDto> {
  PastAppointmentsDtoMapper._();

  static PastAppointmentsDtoMapper? _instance;
  static PastAppointmentsDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PastAppointmentsDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PastAppointmentsDto';

  static DateTime _$startTime(PastAppointmentsDto v) => v.startTime;
  static const Field<PastAppointmentsDto, DateTime> _f$startTime =
      Field('startTime', _$startTime);
  static DateTime _$endTime(PastAppointmentsDto v) => v.endTime;
  static const Field<PastAppointmentsDto, DateTime> _f$endTime =
      Field('endTime', _$endTime);

  @override
  final MappableFields<PastAppointmentsDto> fields = const {
    #startTime: _f$startTime,
    #endTime: _f$endTime,
  };

  static PastAppointmentsDto _instantiate(DecodingData data) {
    return PastAppointmentsDto(
        startTime: data.dec(_f$startTime), endTime: data.dec(_f$endTime));
  }

  @override
  final Function instantiate = _instantiate;

  static PastAppointmentsDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PastAppointmentsDto>(map);
  }

  static PastAppointmentsDto fromJson(String json) {
    return ensureInitialized().decodeJson<PastAppointmentsDto>(json);
  }
}

mixin PastAppointmentsDtoMappable {
  String toJson() {
    return PastAppointmentsDtoMapper.ensureInitialized()
        .encodeJson<PastAppointmentsDto>(this as PastAppointmentsDto);
  }

  Map<String, dynamic> toMap() {
    return PastAppointmentsDtoMapper.ensureInitialized()
        .encodeMap<PastAppointmentsDto>(this as PastAppointmentsDto);
  }

  PastAppointmentsDtoCopyWith<PastAppointmentsDto, PastAppointmentsDto,
      PastAppointmentsDto> get copyWith => _PastAppointmentsDtoCopyWithImpl<
          PastAppointmentsDto, PastAppointmentsDto>(
      this as PastAppointmentsDto, $identity, $identity);
  @override
  String toString() {
    return PastAppointmentsDtoMapper.ensureInitialized()
        .stringifyValue(this as PastAppointmentsDto);
  }

  @override
  bool operator ==(Object other) {
    return PastAppointmentsDtoMapper.ensureInitialized()
        .equalsValue(this as PastAppointmentsDto, other);
  }

  @override
  int get hashCode {
    return PastAppointmentsDtoMapper.ensureInitialized()
        .hashValue(this as PastAppointmentsDto);
  }
}

extension PastAppointmentsDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PastAppointmentsDto, $Out> {
  PastAppointmentsDtoCopyWith<$R, PastAppointmentsDto, $Out>
      get $asPastAppointmentsDto => $base.as(
          (v, t, t2) => _PastAppointmentsDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PastAppointmentsDtoCopyWith<$R, $In extends PastAppointmentsDto,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({DateTime? startTime, DateTime? endTime});
  PastAppointmentsDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PastAppointmentsDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PastAppointmentsDto, $Out>
    implements PastAppointmentsDtoCopyWith<$R, PastAppointmentsDto, $Out> {
  _PastAppointmentsDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PastAppointmentsDto> $mapper =
      PastAppointmentsDtoMapper.ensureInitialized();
  @override
  $R call({DateTime? startTime, DateTime? endTime}) =>
      $apply(FieldCopyWithData({
        if (startTime != null) #startTime: startTime,
        if (endTime != null) #endTime: endTime
      }));
  @override
  PastAppointmentsDto $make(CopyWithData data) => PastAppointmentsDto(
      startTime: data.get(#startTime, or: $value.startTime),
      endTime: data.get(#endTime, or: $value.endTime));

  @override
  PastAppointmentsDtoCopyWith<$R2, PastAppointmentsDto, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PastAppointmentsDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CancelAppointmentDtoMapper extends ClassMapperBase<CancelAppointmentDto> {
  CancelAppointmentDtoMapper._();

  static CancelAppointmentDtoMapper? _instance;
  static CancelAppointmentDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CancelAppointmentDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CancelAppointmentDto';

  static String _$id(CancelAppointmentDto v) => v.id;
  static const Field<CancelAppointmentDto, String> _f$id = Field('id', _$id);
  static String _$status(CancelAppointmentDto v) => v.status;
  static const Field<CancelAppointmentDto, String> _f$status =
      Field('status', _$status);

  @override
  final MappableFields<CancelAppointmentDto> fields = const {
    #id: _f$id,
    #status: _f$status,
  };

  static CancelAppointmentDto _instantiate(DecodingData data) {
    return CancelAppointmentDto(
        id: data.dec(_f$id), status: data.dec(_f$status));
  }

  @override
  final Function instantiate = _instantiate;

  static CancelAppointmentDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CancelAppointmentDto>(map);
  }

  static CancelAppointmentDto fromJson(String json) {
    return ensureInitialized().decodeJson<CancelAppointmentDto>(json);
  }
}

mixin CancelAppointmentDtoMappable {
  String toJson() {
    return CancelAppointmentDtoMapper.ensureInitialized()
        .encodeJson<CancelAppointmentDto>(this as CancelAppointmentDto);
  }

  Map<String, dynamic> toMap() {
    return CancelAppointmentDtoMapper.ensureInitialized()
        .encodeMap<CancelAppointmentDto>(this as CancelAppointmentDto);
  }

  CancelAppointmentDtoCopyWith<CancelAppointmentDto, CancelAppointmentDto,
      CancelAppointmentDto> get copyWith => _CancelAppointmentDtoCopyWithImpl<
          CancelAppointmentDto, CancelAppointmentDto>(
      this as CancelAppointmentDto, $identity, $identity);
  @override
  String toString() {
    return CancelAppointmentDtoMapper.ensureInitialized()
        .stringifyValue(this as CancelAppointmentDto);
  }

  @override
  bool operator ==(Object other) {
    return CancelAppointmentDtoMapper.ensureInitialized()
        .equalsValue(this as CancelAppointmentDto, other);
  }

  @override
  int get hashCode {
    return CancelAppointmentDtoMapper.ensureInitialized()
        .hashValue(this as CancelAppointmentDto);
  }
}

extension CancelAppointmentDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CancelAppointmentDto, $Out> {
  CancelAppointmentDtoCopyWith<$R, CancelAppointmentDto, $Out>
      get $asCancelAppointmentDto => $base.as(
          (v, t, t2) => _CancelAppointmentDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CancelAppointmentDtoCopyWith<
    $R,
    $In extends CancelAppointmentDto,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? status});
  CancelAppointmentDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CancelAppointmentDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CancelAppointmentDto, $Out>
    implements CancelAppointmentDtoCopyWith<$R, CancelAppointmentDto, $Out> {
  _CancelAppointmentDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CancelAppointmentDto> $mapper =
      CancelAppointmentDtoMapper.ensureInitialized();
  @override
  $R call({String? id, String? status}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (status != null) #status: status}));
  @override
  CancelAppointmentDto $make(CopyWithData data) => CancelAppointmentDto(
      id: data.get(#id, or: $value.id),
      status: data.get(#status, or: $value.status));

  @override
  CancelAppointmentDtoCopyWith<$R2, CancelAppointmentDto, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CancelAppointmentDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CreateChatRoomDtoMapper extends ClassMapperBase<CreateChatRoomDto> {
  CreateChatRoomDtoMapper._();

  static CreateChatRoomDtoMapper? _instance;
  static CreateChatRoomDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateChatRoomDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreateChatRoomDto';

  static String _$doctorId(CreateChatRoomDto v) => v.doctorId;
  static const Field<CreateChatRoomDto, String> _f$doctorId =
      Field('doctorId', _$doctorId);
  static String _$patientId(CreateChatRoomDto v) => v.patientId;
  static const Field<CreateChatRoomDto, String> _f$patientId =
      Field('patientId', _$patientId);
  static String _$topic(CreateChatRoomDto v) => v.topic;
  static const Field<CreateChatRoomDto, String> _f$topic =
      Field('topic', _$topic);
  static DateTime _$startTime(CreateChatRoomDto v) => v.startTime;
  static const Field<CreateChatRoomDto, DateTime> _f$startTime =
      Field('startTime', _$startTime);
  static DateTime _$endTime(CreateChatRoomDto v) => v.endTime;
  static const Field<CreateChatRoomDto, DateTime> _f$endTime =
      Field('endTime', _$endTime);

  @override
  final MappableFields<CreateChatRoomDto> fields = const {
    #doctorId: _f$doctorId,
    #patientId: _f$patientId,
    #topic: _f$topic,
    #startTime: _f$startTime,
    #endTime: _f$endTime,
  };

  static CreateChatRoomDto _instantiate(DecodingData data) {
    return CreateChatRoomDto(
        doctorId: data.dec(_f$doctorId),
        patientId: data.dec(_f$patientId),
        topic: data.dec(_f$topic),
        startTime: data.dec(_f$startTime),
        endTime: data.dec(_f$endTime));
  }

  @override
  final Function instantiate = _instantiate;

  static CreateChatRoomDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateChatRoomDto>(map);
  }

  static CreateChatRoomDto fromJson(String json) {
    return ensureInitialized().decodeJson<CreateChatRoomDto>(json);
  }
}

mixin CreateChatRoomDtoMappable {
  String toJson() {
    return CreateChatRoomDtoMapper.ensureInitialized()
        .encodeJson<CreateChatRoomDto>(this as CreateChatRoomDto);
  }

  Map<String, dynamic> toMap() {
    return CreateChatRoomDtoMapper.ensureInitialized()
        .encodeMap<CreateChatRoomDto>(this as CreateChatRoomDto);
  }

  CreateChatRoomDtoCopyWith<CreateChatRoomDto, CreateChatRoomDto,
          CreateChatRoomDto>
      get copyWith =>
          _CreateChatRoomDtoCopyWithImpl<CreateChatRoomDto, CreateChatRoomDto>(
              this as CreateChatRoomDto, $identity, $identity);
  @override
  String toString() {
    return CreateChatRoomDtoMapper.ensureInitialized()
        .stringifyValue(this as CreateChatRoomDto);
  }

  @override
  bool operator ==(Object other) {
    return CreateChatRoomDtoMapper.ensureInitialized()
        .equalsValue(this as CreateChatRoomDto, other);
  }

  @override
  int get hashCode {
    return CreateChatRoomDtoMapper.ensureInitialized()
        .hashValue(this as CreateChatRoomDto);
  }
}

extension CreateChatRoomDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateChatRoomDto, $Out> {
  CreateChatRoomDtoCopyWith<$R, CreateChatRoomDto, $Out>
      get $asCreateChatRoomDto => $base
          .as((v, t, t2) => _CreateChatRoomDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CreateChatRoomDtoCopyWith<$R, $In extends CreateChatRoomDto,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? doctorId,
      String? patientId,
      String? topic,
      DateTime? startTime,
      DateTime? endTime});
  CreateChatRoomDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreateChatRoomDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateChatRoomDto, $Out>
    implements CreateChatRoomDtoCopyWith<$R, CreateChatRoomDto, $Out> {
  _CreateChatRoomDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateChatRoomDto> $mapper =
      CreateChatRoomDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? doctorId,
          String? patientId,
          String? topic,
          DateTime? startTime,
          DateTime? endTime}) =>
      $apply(FieldCopyWithData({
        if (doctorId != null) #doctorId: doctorId,
        if (patientId != null) #patientId: patientId,
        if (topic != null) #topic: topic,
        if (startTime != null) #startTime: startTime,
        if (endTime != null) #endTime: endTime
      }));
  @override
  CreateChatRoomDto $make(CopyWithData data) => CreateChatRoomDto(
      doctorId: data.get(#doctorId, or: $value.doctorId),
      patientId: data.get(#patientId, or: $value.patientId),
      topic: data.get(#topic, or: $value.topic),
      startTime: data.get(#startTime, or: $value.startTime),
      endTime: data.get(#endTime, or: $value.endTime));

  @override
  CreateChatRoomDtoCopyWith<$R2, CreateChatRoomDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CreateChatRoomDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class BookAppointmentRequestMapper
    extends ClassMapperBase<BookAppointmentRequest> {
  BookAppointmentRequestMapper._();

  static BookAppointmentRequestMapper? _instance;
  static BookAppointmentRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BookAppointmentRequestMapper._());
      BookAppointmentDtoMapper.ensureInitialized();
      CreateChatRoomDtoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BookAppointmentRequest';

  static BookAppointmentDto _$appointment(BookAppointmentRequest v) =>
      v.appointment;
  static const Field<BookAppointmentRequest, BookAppointmentDto>
      _f$appointment = Field('appointment', _$appointment);
  static CreateChatRoomDto _$chatRoom(BookAppointmentRequest v) => v.chatRoom;
  static const Field<BookAppointmentRequest, CreateChatRoomDto> _f$chatRoom =
      Field('chatRoom', _$chatRoom);

  @override
  final MappableFields<BookAppointmentRequest> fields = const {
    #appointment: _f$appointment,
    #chatRoom: _f$chatRoom,
  };

  static BookAppointmentRequest _instantiate(DecodingData data) {
    return BookAppointmentRequest(
        appointment: data.dec(_f$appointment), chatRoom: data.dec(_f$chatRoom));
  }

  @override
  final Function instantiate = _instantiate;

  static BookAppointmentRequest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BookAppointmentRequest>(map);
  }

  static BookAppointmentRequest fromJson(String json) {
    return ensureInitialized().decodeJson<BookAppointmentRequest>(json);
  }
}

mixin BookAppointmentRequestMappable {
  String toJson() {
    return BookAppointmentRequestMapper.ensureInitialized()
        .encodeJson<BookAppointmentRequest>(this as BookAppointmentRequest);
  }

  Map<String, dynamic> toMap() {
    return BookAppointmentRequestMapper.ensureInitialized()
        .encodeMap<BookAppointmentRequest>(this as BookAppointmentRequest);
  }

  BookAppointmentRequestCopyWith<BookAppointmentRequest, BookAppointmentRequest,
          BookAppointmentRequest>
      get copyWith => _BookAppointmentRequestCopyWithImpl<
              BookAppointmentRequest, BookAppointmentRequest>(
          this as BookAppointmentRequest, $identity, $identity);
  @override
  String toString() {
    return BookAppointmentRequestMapper.ensureInitialized()
        .stringifyValue(this as BookAppointmentRequest);
  }

  @override
  bool operator ==(Object other) {
    return BookAppointmentRequestMapper.ensureInitialized()
        .equalsValue(this as BookAppointmentRequest, other);
  }

  @override
  int get hashCode {
    return BookAppointmentRequestMapper.ensureInitialized()
        .hashValue(this as BookAppointmentRequest);
  }
}

extension BookAppointmentRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BookAppointmentRequest, $Out> {
  BookAppointmentRequestCopyWith<$R, BookAppointmentRequest, $Out>
      get $asBookAppointmentRequest => $base.as((v, t, t2) =>
          _BookAppointmentRequestCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BookAppointmentRequestCopyWith<
    $R,
    $In extends BookAppointmentRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  BookAppointmentDtoCopyWith<$R, BookAppointmentDto, BookAppointmentDto>
      get appointment;
  CreateChatRoomDtoCopyWith<$R, CreateChatRoomDto, CreateChatRoomDto>
      get chatRoom;
  $R call({BookAppointmentDto? appointment, CreateChatRoomDto? chatRoom});
  BookAppointmentRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BookAppointmentRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BookAppointmentRequest, $Out>
    implements
        BookAppointmentRequestCopyWith<$R, BookAppointmentRequest, $Out> {
  _BookAppointmentRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BookAppointmentRequest> $mapper =
      BookAppointmentRequestMapper.ensureInitialized();
  @override
  BookAppointmentDtoCopyWith<$R, BookAppointmentDto, BookAppointmentDto>
      get appointment =>
          $value.appointment.copyWith.$chain((v) => call(appointment: v));
  @override
  CreateChatRoomDtoCopyWith<$R, CreateChatRoomDto, CreateChatRoomDto>
      get chatRoom => $value.chatRoom.copyWith.$chain((v) => call(chatRoom: v));
  @override
  $R call({BookAppointmentDto? appointment, CreateChatRoomDto? chatRoom}) =>
      $apply(FieldCopyWithData({
        if (appointment != null) #appointment: appointment,
        if (chatRoom != null) #chatRoom: chatRoom
      }));
  @override
  BookAppointmentRequest $make(CopyWithData data) => BookAppointmentRequest(
      appointment: data.get(#appointment, or: $value.appointment),
      chatRoom: data.get(#chatRoom, or: $value.chatRoom));

  @override
  BookAppointmentRequestCopyWith<$R2, BookAppointmentRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _BookAppointmentRequestCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ClinicDoctorDtoMapper extends ClassMapperBase<ClinicDoctorDto> {
  ClinicDoctorDtoMapper._();

  static ClinicDoctorDtoMapper? _instance;
  static ClinicDoctorDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClinicDoctorDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClinicDoctorDto';

  static String _$doctorId(ClinicDoctorDto v) => v.doctorId;
  static const Field<ClinicDoctorDto, String> _f$doctorId =
      Field('doctorId', _$doctorId);
  static String _$name(ClinicDoctorDto v) => v.name;
  static const Field<ClinicDoctorDto, String> _f$name = Field('name', _$name);
  static String _$surname(ClinicDoctorDto v) => v.surname;
  static const Field<ClinicDoctorDto, String> _f$surname =
      Field('surname', _$surname);

  @override
  final MappableFields<ClinicDoctorDto> fields = const {
    #doctorId: _f$doctorId,
    #name: _f$name,
    #surname: _f$surname,
  };

  static ClinicDoctorDto _instantiate(DecodingData data) {
    return ClinicDoctorDto(
        doctorId: data.dec(_f$doctorId),
        name: data.dec(_f$name),
        surname: data.dec(_f$surname));
  }

  @override
  final Function instantiate = _instantiate;

  static ClinicDoctorDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClinicDoctorDto>(map);
  }

  static ClinicDoctorDto fromJson(String json) {
    return ensureInitialized().decodeJson<ClinicDoctorDto>(json);
  }
}

mixin ClinicDoctorDtoMappable {
  String toJson() {
    return ClinicDoctorDtoMapper.ensureInitialized()
        .encodeJson<ClinicDoctorDto>(this as ClinicDoctorDto);
  }

  Map<String, dynamic> toMap() {
    return ClinicDoctorDtoMapper.ensureInitialized()
        .encodeMap<ClinicDoctorDto>(this as ClinicDoctorDto);
  }

  ClinicDoctorDtoCopyWith<ClinicDoctorDto, ClinicDoctorDto, ClinicDoctorDto>
      get copyWith =>
          _ClinicDoctorDtoCopyWithImpl<ClinicDoctorDto, ClinicDoctorDto>(
              this as ClinicDoctorDto, $identity, $identity);
  @override
  String toString() {
    return ClinicDoctorDtoMapper.ensureInitialized()
        .stringifyValue(this as ClinicDoctorDto);
  }

  @override
  bool operator ==(Object other) {
    return ClinicDoctorDtoMapper.ensureInitialized()
        .equalsValue(this as ClinicDoctorDto, other);
  }

  @override
  int get hashCode {
    return ClinicDoctorDtoMapper.ensureInitialized()
        .hashValue(this as ClinicDoctorDto);
  }
}

extension ClinicDoctorDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClinicDoctorDto, $Out> {
  ClinicDoctorDtoCopyWith<$R, ClinicDoctorDto, $Out> get $asClinicDoctorDto =>
      $base.as((v, t, t2) => _ClinicDoctorDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClinicDoctorDtoCopyWith<$R, $In extends ClinicDoctorDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? doctorId, String? name, String? surname});
  ClinicDoctorDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ClinicDoctorDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClinicDoctorDto, $Out>
    implements ClinicDoctorDtoCopyWith<$R, ClinicDoctorDto, $Out> {
  _ClinicDoctorDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClinicDoctorDto> $mapper =
      ClinicDoctorDtoMapper.ensureInitialized();
  @override
  $R call({String? doctorId, String? name, String? surname}) =>
      $apply(FieldCopyWithData({
        if (doctorId != null) #doctorId: doctorId,
        if (name != null) #name: name,
        if (surname != null) #surname: surname
      }));
  @override
  ClinicDoctorDto $make(CopyWithData data) => ClinicDoctorDto(
      doctorId: data.get(#doctorId, or: $value.doctorId),
      name: data.get(#name, or: $value.name),
      surname: data.get(#surname, or: $value.surname));

  @override
  ClinicDoctorDtoCopyWith<$R2, ClinicDoctorDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ClinicDoctorDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
