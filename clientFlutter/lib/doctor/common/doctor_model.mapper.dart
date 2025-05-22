// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'doctor_model.dart';

class DoctorDtoMapper extends ClassMapperBase<DoctorDto> {
  DoctorDtoMapper._();

  static DoctorDtoMapper? _instance;
  static DoctorDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DoctorDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DoctorDto';

  static String _$doctorid(DoctorDto v) => v.doctorid;
  static const Field<DoctorDto, String> _f$doctorid =
      Field('doctorid', _$doctorid);
  static String _$name(DoctorDto v) => v.name;
  static const Field<DoctorDto, String> _f$name = Field('name', _$name);
  static String _$surname(DoctorDto v) => v.surname;
  static const Field<DoctorDto, String> _f$surname =
      Field('surname', _$surname);
  static String _$gender(DoctorDto v) => v.gender;
  static const Field<DoctorDto, String> _f$gender = Field('gender', _$gender);
  static String _$age(DoctorDto v) => v.age;
  static const Field<DoctorDto, String> _f$age = Field('age', _$age);
  static String _$specialty(DoctorDto v) => v.specialty;
  static const Field<DoctorDto, String> _f$specialty =
      Field('specialty', _$specialty);

  @override
  final MappableFields<DoctorDto> fields = const {
    #doctorid: _f$doctorid,
    #name: _f$name,
    #surname: _f$surname,
    #gender: _f$gender,
    #age: _f$age,
    #specialty: _f$specialty,
  };

  static DoctorDto _instantiate(DecodingData data) {
    return DoctorDto(
        doctorid: data.dec(_f$doctorid),
        name: data.dec(_f$name),
        surname: data.dec(_f$surname),
        gender: data.dec(_f$gender),
        age: data.dec(_f$age),
        specialty: data.dec(_f$specialty));
  }

  @override
  final Function instantiate = _instantiate;

  static DoctorDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DoctorDto>(map);
  }

  static DoctorDto fromJson(String json) {
    return ensureInitialized().decodeJson<DoctorDto>(json);
  }
}

mixin DoctorDtoMappable {
  String toJson() {
    return DoctorDtoMapper.ensureInitialized()
        .encodeJson<DoctorDto>(this as DoctorDto);
  }

  Map<String, dynamic> toMap() {
    return DoctorDtoMapper.ensureInitialized()
        .encodeMap<DoctorDto>(this as DoctorDto);
  }

  DoctorDtoCopyWith<DoctorDto, DoctorDto, DoctorDto> get copyWith =>
      _DoctorDtoCopyWithImpl<DoctorDto, DoctorDto>(
          this as DoctorDto, $identity, $identity);
  @override
  String toString() {
    return DoctorDtoMapper.ensureInitialized()
        .stringifyValue(this as DoctorDto);
  }

  @override
  bool operator ==(Object other) {
    return DoctorDtoMapper.ensureInitialized()
        .equalsValue(this as DoctorDto, other);
  }

  @override
  int get hashCode {
    return DoctorDtoMapper.ensureInitialized().hashValue(this as DoctorDto);
  }
}

extension DoctorDtoValueCopy<$R, $Out> on ObjectCopyWith<$R, DoctorDto, $Out> {
  DoctorDtoCopyWith<$R, DoctorDto, $Out> get $asDoctorDto =>
      $base.as((v, t, t2) => _DoctorDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DoctorDtoCopyWith<$R, $In extends DoctorDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? doctorid,
      String? name,
      String? surname,
      String? gender,
      String? age,
      String? specialty});
  DoctorDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DoctorDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DoctorDto, $Out>
    implements DoctorDtoCopyWith<$R, DoctorDto, $Out> {
  _DoctorDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DoctorDto> $mapper =
      DoctorDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? doctorid,
          String? name,
          String? surname,
          String? gender,
          String? age,
          String? specialty}) =>
      $apply(FieldCopyWithData({
        if (doctorid != null) #doctorid: doctorid,
        if (name != null) #name: name,
        if (surname != null) #surname: surname,
        if (gender != null) #gender: gender,
        if (age != null) #age: age,
        if (specialty != null) #specialty: specialty
      }));
  @override
  DoctorDto $make(CopyWithData data) => DoctorDto(
      doctorid: data.get(#doctorid, or: $value.doctorid),
      name: data.get(#name, or: $value.name),
      surname: data.get(#surname, or: $value.surname),
      gender: data.get(#gender, or: $value.gender),
      age: data.get(#age, or: $value.age),
      specialty: data.get(#specialty, or: $value.specialty));

  @override
  DoctorDtoCopyWith<$R2, DoctorDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DoctorDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
