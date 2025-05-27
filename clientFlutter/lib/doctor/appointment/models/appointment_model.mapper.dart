// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'appointment_model.dart';

class AppointmentDoctorSideDtoMapper
    extends ClassMapperBase<AppointmentDoctorSideDto> {
  AppointmentDoctorSideDtoMapper._();

  static AppointmentDoctorSideDtoMapper? _instance;
  static AppointmentDoctorSideDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AppointmentDoctorSideDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AppointmentDoctorSideDto';

  static String _$id(AppointmentDoctorSideDto v) => v.id;
  static const Field<AppointmentDoctorSideDto, String> _f$id =
      Field('id', _$id);
  static String _$doctorId(AppointmentDoctorSideDto v) => v.doctorId;
  static const Field<AppointmentDoctorSideDto, String> _f$doctorId =
      Field('doctorId', _$doctorId);
  static String _$patientId(AppointmentDoctorSideDto v) => v.patientId;
  static const Field<AppointmentDoctorSideDto, String> _f$patientId =
      Field('patientId', _$patientId);
  static String _$status(AppointmentDoctorSideDto v) => v.status;
  static const Field<AppointmentDoctorSideDto, String> _f$status =
      Field('status', _$status);
  static String _$notes(AppointmentDoctorSideDto v) => v.notes;
  static const Field<AppointmentDoctorSideDto, String> _f$notes =
      Field('notes', _$notes);
  static DateTime _$startTime(AppointmentDoctorSideDto v) => v.startTime;
  static const Field<AppointmentDoctorSideDto, DateTime> _f$startTime =
      Field('startTime', _$startTime);
  static DateTime _$endTime(AppointmentDoctorSideDto v) => v.endTime;
  static const Field<AppointmentDoctorSideDto, DateTime> _f$endTime =
      Field('endTime', _$endTime);

  @override
  final MappableFields<AppointmentDoctorSideDto> fields = const {
    #id: _f$id,
    #doctorId: _f$doctorId,
    #patientId: _f$patientId,
    #status: _f$status,
    #notes: _f$notes,
    #startTime: _f$startTime,
    #endTime: _f$endTime,
  };

  static AppointmentDoctorSideDto _instantiate(DecodingData data) {
    return AppointmentDoctorSideDto(
        id: data.dec(_f$id),
        doctorId: data.dec(_f$doctorId),
        patientId: data.dec(_f$patientId),
        status: data.dec(_f$status),
        notes: data.dec(_f$notes),
        startTime: data.dec(_f$startTime),
        endTime: data.dec(_f$endTime));
  }

  @override
  final Function instantiate = _instantiate;

  static AppointmentDoctorSideDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppointmentDoctorSideDto>(map);
  }

  static AppointmentDoctorSideDto fromJson(String json) {
    return ensureInitialized().decodeJson<AppointmentDoctorSideDto>(json);
  }
}

mixin AppointmentDoctorSideDtoMappable {
  String toJson() {
    return AppointmentDoctorSideDtoMapper.ensureInitialized()
        .encodeJson<AppointmentDoctorSideDto>(this as AppointmentDoctorSideDto);
  }

  Map<String, dynamic> toMap() {
    return AppointmentDoctorSideDtoMapper.ensureInitialized()
        .encodeMap<AppointmentDoctorSideDto>(this as AppointmentDoctorSideDto);
  }

  AppointmentDoctorSideDtoCopyWith<AppointmentDoctorSideDto,
          AppointmentDoctorSideDto, AppointmentDoctorSideDto>
      get copyWith => _AppointmentDoctorSideDtoCopyWithImpl<
              AppointmentDoctorSideDto, AppointmentDoctorSideDto>(
          this as AppointmentDoctorSideDto, $identity, $identity);
  @override
  String toString() {
    return AppointmentDoctorSideDtoMapper.ensureInitialized()
        .stringifyValue(this as AppointmentDoctorSideDto);
  }

  @override
  bool operator ==(Object other) {
    return AppointmentDoctorSideDtoMapper.ensureInitialized()
        .equalsValue(this as AppointmentDoctorSideDto, other);
  }

  @override
  int get hashCode {
    return AppointmentDoctorSideDtoMapper.ensureInitialized()
        .hashValue(this as AppointmentDoctorSideDto);
  }
}

extension AppointmentDoctorSideDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppointmentDoctorSideDto, $Out> {
  AppointmentDoctorSideDtoCopyWith<$R, AppointmentDoctorSideDto, $Out>
      get $asAppointmentDoctorSideDto => $base.as((v, t, t2) =>
          _AppointmentDoctorSideDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppointmentDoctorSideDtoCopyWith<
    $R,
    $In extends AppointmentDoctorSideDto,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? doctorId,
      String? patientId,
      String? status,
      String? notes,
      DateTime? startTime,
      DateTime? endTime});
  AppointmentDoctorSideDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AppointmentDoctorSideDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppointmentDoctorSideDto, $Out>
    implements
        AppointmentDoctorSideDtoCopyWith<$R, AppointmentDoctorSideDto, $Out> {
  _AppointmentDoctorSideDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppointmentDoctorSideDto> $mapper =
      AppointmentDoctorSideDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? doctorId,
          String? patientId,
          String? status,
          String? notes,
          DateTime? startTime,
          DateTime? endTime}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (doctorId != null) #doctorId: doctorId,
        if (patientId != null) #patientId: patientId,
        if (status != null) #status: status,
        if (notes != null) #notes: notes,
        if (startTime != null) #startTime: startTime,
        if (endTime != null) #endTime: endTime
      }));
  @override
  AppointmentDoctorSideDto $make(CopyWithData data) => AppointmentDoctorSideDto(
      id: data.get(#id, or: $value.id),
      doctorId: data.get(#doctorId, or: $value.doctorId),
      patientId: data.get(#patientId, or: $value.patientId),
      status: data.get(#status, or: $value.status),
      notes: data.get(#notes, or: $value.notes),
      startTime: data.get(#startTime, or: $value.startTime),
      endTime: data.get(#endTime, or: $value.endTime));

  @override
  AppointmentDoctorSideDtoCopyWith<$R2, AppointmentDoctorSideDto, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AppointmentDoctorSideDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
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
  static bool _$isFinished(CreateChatRoomDto v) => v.isFinished;
  static const Field<CreateChatRoomDto, bool> _f$isFinished =
      Field('isFinished', _$isFinished);
  static DateTime _$endTime(CreateChatRoomDto v) => v.endTime;
  static const Field<CreateChatRoomDto, DateTime> _f$endTime =
      Field('endTime', _$endTime);

  @override
  final MappableFields<CreateChatRoomDto> fields = const {
    #doctorId: _f$doctorId,
    #patientId: _f$patientId,
    #topic: _f$topic,
    #startTime: _f$startTime,
    #isFinished: _f$isFinished,
    #endTime: _f$endTime,
  };

  static CreateChatRoomDto _instantiate(DecodingData data) {
    return CreateChatRoomDto(
        doctorId: data.dec(_f$doctorId),
        patientId: data.dec(_f$patientId),
        topic: data.dec(_f$topic),
        startTime: data.dec(_f$startTime),
        isFinished: data.dec(_f$isFinished),
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
      bool? isFinished,
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
          bool? isFinished,
          DateTime? endTime}) =>
      $apply(FieldCopyWithData({
        if (doctorId != null) #doctorId: doctorId,
        if (patientId != null) #patientId: patientId,
        if (topic != null) #topic: topic,
        if (startTime != null) #startTime: startTime,
        if (isFinished != null) #isFinished: isFinished,
        if (endTime != null) #endTime: endTime
      }));
  @override
  CreateChatRoomDto $make(CopyWithData data) => CreateChatRoomDto(
      doctorId: data.get(#doctorId, or: $value.doctorId),
      patientId: data.get(#patientId, or: $value.patientId),
      topic: data.get(#topic, or: $value.topic),
      startTime: data.get(#startTime, or: $value.startTime),
      isFinished: data.get(#isFinished, or: $value.isFinished),
      endTime: data.get(#endTime, or: $value.endTime));

  @override
  CreateChatRoomDtoCopyWith<$R2, CreateChatRoomDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CreateChatRoomDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
