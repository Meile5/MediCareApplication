// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'patient_model.dart';

class PatientDtoMapper extends ClassMapperBase<PatientDto> {
  PatientDtoMapper._();

  static PatientDtoMapper? _instance;
  static PatientDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PatientDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PatientDto';

  static String _$userid(PatientDto v) => v.userid;
  static const Field<PatientDto, String> _f$userid = Field('userid', _$userid);
  static String _$name(PatientDto v) => v.name;
  static const Field<PatientDto, String> _f$name = Field('name', _$name);
  static String _$surname(PatientDto v) => v.surname;
  static const Field<PatientDto, String> _f$surname =
      Field('surname', _$surname);
  static String _$gender(PatientDto v) => v.gender;
  static const Field<PatientDto, String> _f$gender = Field('gender', _$gender);
  static String _$age(PatientDto v) => v.age;
  static const Field<PatientDto, String> _f$age = Field('age', _$age);
  static String _$bloodtype(PatientDto v) => v.bloodtype;
  static const Field<PatientDto, String> _f$bloodtype =
      Field('bloodtype', _$bloodtype);
  static String? _$allergies(PatientDto v) => v.allergies;
  static const Field<PatientDto, String> _f$allergies =
      Field('allergies', _$allergies, opt: true);
  static String _$phonenumber(PatientDto v) => v.phonenumber;
  static const Field<PatientDto, String> _f$phonenumber =
      Field('phonenumber', _$phonenumber);
  static String _$address(PatientDto v) => v.address;
  static const Field<PatientDto, String> _f$address =
      Field('address', _$address);
  static String? _$deviceId(PatientDto v) => v.deviceId;
  static const Field<PatientDto, String> _f$deviceId =
      Field('deviceId', _$deviceId, opt: true);

  @override
  final MappableFields<PatientDto> fields = const {
    #userid: _f$userid,
    #name: _f$name,
    #surname: _f$surname,
    #gender: _f$gender,
    #age: _f$age,
    #bloodtype: _f$bloodtype,
    #allergies: _f$allergies,
    #phonenumber: _f$phonenumber,
    #address: _f$address,
    #deviceId: _f$deviceId,
  };

  static PatientDto _instantiate(DecodingData data) {
    return PatientDto(
        userid: data.dec(_f$userid),
        name: data.dec(_f$name),
        surname: data.dec(_f$surname),
        gender: data.dec(_f$gender),
        age: data.dec(_f$age),
        bloodtype: data.dec(_f$bloodtype),
        allergies: data.dec(_f$allergies),
        phonenumber: data.dec(_f$phonenumber),
        address: data.dec(_f$address),
        deviceId: data.dec(_f$deviceId));
  }

  @override
  final Function instantiate = _instantiate;

  static PatientDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PatientDto>(map);
  }

  static PatientDto fromJson(String json) {
    return ensureInitialized().decodeJson<PatientDto>(json);
  }
}

mixin PatientDtoMappable {
  String toJson() {
    return PatientDtoMapper.ensureInitialized()
        .encodeJson<PatientDto>(this as PatientDto);
  }

  Map<String, dynamic> toMap() {
    return PatientDtoMapper.ensureInitialized()
        .encodeMap<PatientDto>(this as PatientDto);
  }

  PatientDtoCopyWith<PatientDto, PatientDto, PatientDto> get copyWith =>
      _PatientDtoCopyWithImpl<PatientDto, PatientDto>(
          this as PatientDto, $identity, $identity);
  @override
  String toString() {
    return PatientDtoMapper.ensureInitialized()
        .stringifyValue(this as PatientDto);
  }

  @override
  bool operator ==(Object other) {
    return PatientDtoMapper.ensureInitialized()
        .equalsValue(this as PatientDto, other);
  }

  @override
  int get hashCode {
    return PatientDtoMapper.ensureInitialized().hashValue(this as PatientDto);
  }
}

extension PatientDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PatientDto, $Out> {
  PatientDtoCopyWith<$R, PatientDto, $Out> get $asPatientDto =>
      $base.as((v, t, t2) => _PatientDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PatientDtoCopyWith<$R, $In extends PatientDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? userid,
      String? name,
      String? surname,
      String? gender,
      String? age,
      String? bloodtype,
      String? allergies,
      String? phonenumber,
      String? address,
      String? deviceId});
  PatientDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PatientDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PatientDto, $Out>
    implements PatientDtoCopyWith<$R, PatientDto, $Out> {
  _PatientDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PatientDto> $mapper =
      PatientDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? userid,
          String? name,
          String? surname,
          String? gender,
          String? age,
          String? bloodtype,
          Object? allergies = $none,
          String? phonenumber,
          String? address,
          Object? deviceId = $none}) =>
      $apply(FieldCopyWithData({
        if (userid != null) #userid: userid,
        if (name != null) #name: name,
        if (surname != null) #surname: surname,
        if (gender != null) #gender: gender,
        if (age != null) #age: age,
        if (bloodtype != null) #bloodtype: bloodtype,
        if (allergies != $none) #allergies: allergies,
        if (phonenumber != null) #phonenumber: phonenumber,
        if (address != null) #address: address,
        if (deviceId != $none) #deviceId: deviceId
      }));
  @override
  PatientDto $make(CopyWithData data) => PatientDto(
      userid: data.get(#userid, or: $value.userid),
      name: data.get(#name, or: $value.name),
      surname: data.get(#surname, or: $value.surname),
      gender: data.get(#gender, or: $value.gender),
      age: data.get(#age, or: $value.age),
      bloodtype: data.get(#bloodtype, or: $value.bloodtype),
      allergies: data.get(#allergies, or: $value.allergies),
      phonenumber: data.get(#phonenumber, or: $value.phonenumber),
      address: data.get(#address, or: $value.address),
      deviceId: data.get(#deviceId, or: $value.deviceId));

  @override
  PatientDtoCopyWith<$R2, PatientDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PatientDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
