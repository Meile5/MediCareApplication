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
