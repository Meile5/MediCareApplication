// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'appointment_model.dart';

class AppointmentDtoMapper extends ClassMapperBase<AppointmentDto> {
  AppointmentDtoMapper._();

  static AppointmentDtoMapper? _instance;
  static AppointmentDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppointmentDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AppointmentDto';

  static String _$id(AppointmentDto v) => v.id;
  static const Field<AppointmentDto, String> _f$id = Field('id', _$id);
  static String _$doctorId(AppointmentDto v) => v.doctorId;
  static const Field<AppointmentDto, String> _f$doctorId =
      Field('doctorId', _$doctorId);
  static String _$patientId(AppointmentDto v) => v.patientId;
  static const Field<AppointmentDto, String> _f$patientId =
      Field('patientId', _$patientId);
  static String _$status(AppointmentDto v) => v.status;
  static const Field<AppointmentDto, String> _f$status =
      Field('status', _$status);
  static String _$notes(AppointmentDto v) => v.notes;
  static const Field<AppointmentDto, String> _f$notes = Field('notes', _$notes);
  static DateTime? _$createdAt(AppointmentDto v) => v.createdAt;
  static const Field<AppointmentDto, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static DateTime _$updatedAt(AppointmentDto v) => v.updatedAt;
  static const Field<AppointmentDto, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt);
  static DateTime _$startTime(AppointmentDto v) => v.startTime;
  static const Field<AppointmentDto, DateTime> _f$startTime =
      Field('startTime', _$startTime);
  static DateTime _$endTime(AppointmentDto v) => v.endTime;
  static const Field<AppointmentDto, DateTime> _f$endTime =
      Field('endTime', _$endTime);

  @override
  final MappableFields<AppointmentDto> fields = const {
    #id: _f$id,
    #doctorId: _f$doctorId,
    #patientId: _f$patientId,
    #status: _f$status,
    #notes: _f$notes,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #startTime: _f$startTime,
    #endTime: _f$endTime,
  };

  static AppointmentDto _instantiate(DecodingData data) {
    return AppointmentDto(
        id: data.dec(_f$id),
        doctorId: data.dec(_f$doctorId),
        patientId: data.dec(_f$patientId),
        status: data.dec(_f$status),
        notes: data.dec(_f$notes),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        startTime: data.dec(_f$startTime),
        endTime: data.dec(_f$endTime));
  }

  @override
  final Function instantiate = _instantiate;

  static AppointmentDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppointmentDto>(map);
  }

  static AppointmentDto fromJson(String json) {
    return ensureInitialized().decodeJson<AppointmentDto>(json);
  }
}

mixin AppointmentDtoMappable {
  String toJson() {
    return AppointmentDtoMapper.ensureInitialized()
        .encodeJson<AppointmentDto>(this as AppointmentDto);
  }

  Map<String, dynamic> toMap() {
    return AppointmentDtoMapper.ensureInitialized()
        .encodeMap<AppointmentDto>(this as AppointmentDto);
  }

  AppointmentDtoCopyWith<AppointmentDto, AppointmentDto, AppointmentDto>
      get copyWith =>
          _AppointmentDtoCopyWithImpl<AppointmentDto, AppointmentDto>(
              this as AppointmentDto, $identity, $identity);
  @override
  String toString() {
    return AppointmentDtoMapper.ensureInitialized()
        .stringifyValue(this as AppointmentDto);
  }

  @override
  bool operator ==(Object other) {
    return AppointmentDtoMapper.ensureInitialized()
        .equalsValue(this as AppointmentDto, other);
  }

  @override
  int get hashCode {
    return AppointmentDtoMapper.ensureInitialized()
        .hashValue(this as AppointmentDto);
  }
}

extension AppointmentDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppointmentDto, $Out> {
  AppointmentDtoCopyWith<$R, AppointmentDto, $Out> get $asAppointmentDto =>
      $base.as((v, t, t2) => _AppointmentDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppointmentDtoCopyWith<$R, $In extends AppointmentDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? doctorId,
      String? patientId,
      String? status,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? startTime,
      DateTime? endTime});
  AppointmentDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AppointmentDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppointmentDto, $Out>
    implements AppointmentDtoCopyWith<$R, AppointmentDto, $Out> {
  _AppointmentDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppointmentDto> $mapper =
      AppointmentDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? doctorId,
          String? patientId,
          String? status,
          String? notes,
          Object? createdAt = $none,
          DateTime? updatedAt,
          DateTime? startTime,
          DateTime? endTime}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (doctorId != null) #doctorId: doctorId,
        if (patientId != null) #patientId: patientId,
        if (status != null) #status: status,
        if (notes != null) #notes: notes,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != null) #updatedAt: updatedAt,
        if (startTime != null) #startTime: startTime,
        if (endTime != null) #endTime: endTime
      }));
  @override
  AppointmentDto $make(CopyWithData data) => AppointmentDto(
      id: data.get(#id, or: $value.id),
      doctorId: data.get(#doctorId, or: $value.doctorId),
      patientId: data.get(#patientId, or: $value.patientId),
      status: data.get(#status, or: $value.status),
      notes: data.get(#notes, or: $value.notes),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      startTime: data.get(#startTime, or: $value.startTime),
      endTime: data.get(#endTime, or: $value.endTime));

  @override
  AppointmentDtoCopyWith<$R2, AppointmentDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AppointmentDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
