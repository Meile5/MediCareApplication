// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'models_overview.dart';

class ClinicInfoDtoMapper extends ClassMapperBase<ClinicInfoDto> {
  ClinicInfoDtoMapper._();

  static ClinicInfoDtoMapper? _instance;
  static ClinicInfoDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClinicInfoDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClinicInfoDto';

  static String _$id(ClinicInfoDto v) => v.id;
  static const Field<ClinicInfoDto, String> _f$id = Field('id', _$id);
  static String _$clinicname(ClinicInfoDto v) => v.clinicname;
  static const Field<ClinicInfoDto, String> _f$clinicname =
      Field('clinicname', _$clinicname);
  static String _$address(ClinicInfoDto v) => v.address;
  static const Field<ClinicInfoDto, String> _f$address =
      Field('address', _$address);
  static String _$phonenumber(ClinicInfoDto v) => v.phonenumber;
  static const Field<ClinicInfoDto, String> _f$phonenumber =
      Field('phonenumber', _$phonenumber);
  static String _$type(ClinicInfoDto v) => v.type;
  static const Field<ClinicInfoDto, String> _f$type = Field('type', _$type);

  @override
  final MappableFields<ClinicInfoDto> fields = const {
    #id: _f$id,
    #clinicname: _f$clinicname,
    #address: _f$address,
    #phonenumber: _f$phonenumber,
    #type: _f$type,
  };

  static ClinicInfoDto _instantiate(DecodingData data) {
    return ClinicInfoDto(
        id: data.dec(_f$id),
        clinicname: data.dec(_f$clinicname),
        address: data.dec(_f$address),
        phonenumber: data.dec(_f$phonenumber),
        type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static ClinicInfoDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClinicInfoDto>(map);
  }

  static ClinicInfoDto fromJson(String json) {
    return ensureInitialized().decodeJson<ClinicInfoDto>(json);
  }
}

mixin ClinicInfoDtoMappable {
  String toJson() {
    return ClinicInfoDtoMapper.ensureInitialized()
        .encodeJson<ClinicInfoDto>(this as ClinicInfoDto);
  }

  Map<String, dynamic> toMap() {
    return ClinicInfoDtoMapper.ensureInitialized()
        .encodeMap<ClinicInfoDto>(this as ClinicInfoDto);
  }

  ClinicInfoDtoCopyWith<ClinicInfoDto, ClinicInfoDto, ClinicInfoDto>
      get copyWith => _ClinicInfoDtoCopyWithImpl<ClinicInfoDto, ClinicInfoDto>(
          this as ClinicInfoDto, $identity, $identity);
  @override
  String toString() {
    return ClinicInfoDtoMapper.ensureInitialized()
        .stringifyValue(this as ClinicInfoDto);
  }

  @override
  bool operator ==(Object other) {
    return ClinicInfoDtoMapper.ensureInitialized()
        .equalsValue(this as ClinicInfoDto, other);
  }

  @override
  int get hashCode {
    return ClinicInfoDtoMapper.ensureInitialized()
        .hashValue(this as ClinicInfoDto);
  }
}

extension ClinicInfoDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClinicInfoDto, $Out> {
  ClinicInfoDtoCopyWith<$R, ClinicInfoDto, $Out> get $asClinicInfoDto =>
      $base.as((v, t, t2) => _ClinicInfoDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClinicInfoDtoCopyWith<$R, $In extends ClinicInfoDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? clinicname,
      String? address,
      String? phonenumber,
      String? type});
  ClinicInfoDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ClinicInfoDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClinicInfoDto, $Out>
    implements ClinicInfoDtoCopyWith<$R, ClinicInfoDto, $Out> {
  _ClinicInfoDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClinicInfoDto> $mapper =
      ClinicInfoDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? clinicname,
          String? address,
          String? phonenumber,
          String? type}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (clinicname != null) #clinicname: clinicname,
        if (address != null) #address: address,
        if (phonenumber != null) #phonenumber: phonenumber,
        if (type != null) #type: type
      }));
  @override
  ClinicInfoDto $make(CopyWithData data) => ClinicInfoDto(
      id: data.get(#id, or: $value.id),
      clinicname: data.get(#clinicname, or: $value.clinicname),
      address: data.get(#address, or: $value.address),
      phonenumber: data.get(#phonenumber, or: $value.phonenumber),
      type: data.get(#type, or: $value.type));

  @override
  ClinicInfoDtoCopyWith<$R2, ClinicInfoDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ClinicInfoDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
