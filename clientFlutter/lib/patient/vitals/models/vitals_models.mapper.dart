// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'vitals_models.dart';

class SaveVitalsDtoMapper extends ClassMapperBase<SaveVitalsDto> {
  SaveVitalsDtoMapper._();

  static SaveVitalsDtoMapper? _instance;
  static SaveVitalsDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SaveVitalsDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SaveVitalsDto';

  static String _$PatientId(SaveVitalsDto v) => v.PatientId;
  static const Field<SaveVitalsDto, String> _f$PatientId =
      Field('PatientId', _$PatientId);
  static double _$Temperature(SaveVitalsDto v) => v.Temperature;
  static const Field<SaveVitalsDto, double> _f$Temperature =
      Field('Temperature', _$Temperature);
  static double? _$OxygenLevel(SaveVitalsDto v) => v.OxygenLevel;
  static const Field<SaveVitalsDto, double> _f$OxygenLevel =
      Field('OxygenLevel', _$OxygenLevel);
  static List<int> _$Ecg(SaveVitalsDto v) => v.Ecg;
  static const Field<SaveVitalsDto, List<int>> _f$Ecg = Field('Ecg', _$Ecg);
  static int? _$HeartRate(SaveVitalsDto v) => v.HeartRate;
  static const Field<SaveVitalsDto, int> _f$HeartRate =
      Field('HeartRate', _$HeartRate);

  @override
  final MappableFields<SaveVitalsDto> fields = const {
    #PatientId: _f$PatientId,
    #Temperature: _f$Temperature,
    #OxygenLevel: _f$OxygenLevel,
    #Ecg: _f$Ecg,
    #HeartRate: _f$HeartRate,
  };

  static SaveVitalsDto _instantiate(DecodingData data) {
    return SaveVitalsDto(
        PatientId: data.dec(_f$PatientId),
        Temperature: data.dec(_f$Temperature),
        OxygenLevel: data.dec(_f$OxygenLevel),
        Ecg: data.dec(_f$Ecg),
        HeartRate: data.dec(_f$HeartRate));
  }

  @override
  final Function instantiate = _instantiate;

  static SaveVitalsDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SaveVitalsDto>(map);
  }

  static SaveVitalsDto fromJson(String json) {
    return ensureInitialized().decodeJson<SaveVitalsDto>(json);
  }
}

mixin SaveVitalsDtoMappable {
  String toJson() {
    return SaveVitalsDtoMapper.ensureInitialized()
        .encodeJson<SaveVitalsDto>(this as SaveVitalsDto);
  }

  Map<String, dynamic> toMap() {
    return SaveVitalsDtoMapper.ensureInitialized()
        .encodeMap<SaveVitalsDto>(this as SaveVitalsDto);
  }

  SaveVitalsDtoCopyWith<SaveVitalsDto, SaveVitalsDto, SaveVitalsDto>
      get copyWith => _SaveVitalsDtoCopyWithImpl<SaveVitalsDto, SaveVitalsDto>(
          this as SaveVitalsDto, $identity, $identity);
  @override
  String toString() {
    return SaveVitalsDtoMapper.ensureInitialized()
        .stringifyValue(this as SaveVitalsDto);
  }

  @override
  bool operator ==(Object other) {
    return SaveVitalsDtoMapper.ensureInitialized()
        .equalsValue(this as SaveVitalsDto, other);
  }

  @override
  int get hashCode {
    return SaveVitalsDtoMapper.ensureInitialized()
        .hashValue(this as SaveVitalsDto);
  }
}

extension SaveVitalsDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SaveVitalsDto, $Out> {
  SaveVitalsDtoCopyWith<$R, SaveVitalsDto, $Out> get $asSaveVitalsDto =>
      $base.as((v, t, t2) => _SaveVitalsDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SaveVitalsDtoCopyWith<$R, $In extends SaveVitalsDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get Ecg;
  $R call(
      {String? PatientId,
      double? Temperature,
      double? OxygenLevel,
      List<int>? Ecg,
      int? HeartRate});
  SaveVitalsDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SaveVitalsDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SaveVitalsDto, $Out>
    implements SaveVitalsDtoCopyWith<$R, SaveVitalsDto, $Out> {
  _SaveVitalsDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SaveVitalsDto> $mapper =
      SaveVitalsDtoMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get Ecg => ListCopyWith(
      $value.Ecg,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(Ecg: v));
  @override
  $R call(
          {String? PatientId,
          double? Temperature,
          Object? OxygenLevel = $none,
          List<int>? Ecg,
          Object? HeartRate = $none}) =>
      $apply(FieldCopyWithData({
        if (PatientId != null) #PatientId: PatientId,
        if (Temperature != null) #Temperature: Temperature,
        if (OxygenLevel != $none) #OxygenLevel: OxygenLevel,
        if (Ecg != null) #Ecg: Ecg,
        if (HeartRate != $none) #HeartRate: HeartRate
      }));
  @override
  SaveVitalsDto $make(CopyWithData data) => SaveVitalsDto(
      PatientId: data.get(#PatientId, or: $value.PatientId),
      Temperature: data.get(#Temperature, or: $value.Temperature),
      OxygenLevel: data.get(#OxygenLevel, or: $value.OxygenLevel),
      Ecg: data.get(#Ecg, or: $value.Ecg),
      HeartRate: data.get(#HeartRate, or: $value.HeartRate));

  @override
  SaveVitalsDtoCopyWith<$R2, SaveVitalsDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SaveVitalsDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ClientWantsToPairDeviceDtoMapper
    extends ClassMapperBase<ClientWantsToPairDeviceDto> {
  ClientWantsToPairDeviceDtoMapper._();

  static ClientWantsToPairDeviceDtoMapper? _instance;
  static ClientWantsToPairDeviceDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ClientWantsToPairDeviceDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClientWantsToPairDeviceDto';

  static String _$PatientId(ClientWantsToPairDeviceDto v) => v.PatientId;
  static const Field<ClientWantsToPairDeviceDto, String> _f$PatientId =
      Field('PatientId', _$PatientId);
  static String _$DeviceId(ClientWantsToPairDeviceDto v) => v.DeviceId;
  static const Field<ClientWantsToPairDeviceDto, String> _f$DeviceId =
      Field('DeviceId', _$DeviceId);
  static String _$PairingCode(ClientWantsToPairDeviceDto v) => v.PairingCode;
  static const Field<ClientWantsToPairDeviceDto, String> _f$PairingCode =
      Field('PairingCode', _$PairingCode);

  @override
  final MappableFields<ClientWantsToPairDeviceDto> fields = const {
    #PatientId: _f$PatientId,
    #DeviceId: _f$DeviceId,
    #PairingCode: _f$PairingCode,
  };

  static ClientWantsToPairDeviceDto _instantiate(DecodingData data) {
    return ClientWantsToPairDeviceDto(
        PatientId: data.dec(_f$PatientId),
        DeviceId: data.dec(_f$DeviceId),
        PairingCode: data.dec(_f$PairingCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ClientWantsToPairDeviceDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClientWantsToPairDeviceDto>(map);
  }

  static ClientWantsToPairDeviceDto fromJson(String json) {
    return ensureInitialized().decodeJson<ClientWantsToPairDeviceDto>(json);
  }
}

mixin ClientWantsToPairDeviceDtoMappable {
  String toJson() {
    return ClientWantsToPairDeviceDtoMapper.ensureInitialized()
        .encodeJson<ClientWantsToPairDeviceDto>(
            this as ClientWantsToPairDeviceDto);
  }

  Map<String, dynamic> toMap() {
    return ClientWantsToPairDeviceDtoMapper.ensureInitialized()
        .encodeMap<ClientWantsToPairDeviceDto>(
            this as ClientWantsToPairDeviceDto);
  }

  ClientWantsToPairDeviceDtoCopyWith<ClientWantsToPairDeviceDto,
          ClientWantsToPairDeviceDto, ClientWantsToPairDeviceDto>
      get copyWith => _ClientWantsToPairDeviceDtoCopyWithImpl<
              ClientWantsToPairDeviceDto, ClientWantsToPairDeviceDto>(
          this as ClientWantsToPairDeviceDto, $identity, $identity);
  @override
  String toString() {
    return ClientWantsToPairDeviceDtoMapper.ensureInitialized()
        .stringifyValue(this as ClientWantsToPairDeviceDto);
  }

  @override
  bool operator ==(Object other) {
    return ClientWantsToPairDeviceDtoMapper.ensureInitialized()
        .equalsValue(this as ClientWantsToPairDeviceDto, other);
  }

  @override
  int get hashCode {
    return ClientWantsToPairDeviceDtoMapper.ensureInitialized()
        .hashValue(this as ClientWantsToPairDeviceDto);
  }
}

extension ClientWantsToPairDeviceDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClientWantsToPairDeviceDto, $Out> {
  ClientWantsToPairDeviceDtoCopyWith<$R, ClientWantsToPairDeviceDto, $Out>
      get $asClientWantsToPairDeviceDto => $base.as((v, t, t2) =>
          _ClientWantsToPairDeviceDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ClientWantsToPairDeviceDtoCopyWith<
    $R,
    $In extends ClientWantsToPairDeviceDto,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? PatientId, String? DeviceId, String? PairingCode});
  ClientWantsToPairDeviceDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ClientWantsToPairDeviceDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClientWantsToPairDeviceDto, $Out>
    implements
        ClientWantsToPairDeviceDtoCopyWith<$R, ClientWantsToPairDeviceDto,
            $Out> {
  _ClientWantsToPairDeviceDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClientWantsToPairDeviceDto> $mapper =
      ClientWantsToPairDeviceDtoMapper.ensureInitialized();
  @override
  $R call({String? PatientId, String? DeviceId, String? PairingCode}) =>
      $apply(FieldCopyWithData({
        if (PatientId != null) #PatientId: PatientId,
        if (DeviceId != null) #DeviceId: DeviceId,
        if (PairingCode != null) #PairingCode: PairingCode
      }));
  @override
  ClientWantsToPairDeviceDto $make(CopyWithData data) =>
      ClientWantsToPairDeviceDto(
          PatientId: data.get(#PatientId, or: $value.PatientId),
          DeviceId: data.get(#DeviceId, or: $value.DeviceId),
          PairingCode: data.get(#PairingCode, or: $value.PairingCode));

  @override
  ClientWantsToPairDeviceDtoCopyWith<$R2, ClientWantsToPairDeviceDto, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ClientWantsToPairDeviceDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
