// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'patients_overview_models.dart';

class DiagnosesDtoMapper extends ClassMapperBase<DiagnosesDto> {
  DiagnosesDtoMapper._();

  static DiagnosesDtoMapper? _instance;
  static DiagnosesDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DiagnosesDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DiagnosesDto';

  static String _$patientDiagnosis(DiagnosesDto v) => v.patientDiagnosis;
  static const Field<DiagnosesDto, String> _f$patientDiagnosis =
      Field('patientDiagnosis', _$patientDiagnosis);
  static String _$treatment(DiagnosesDto v) => v.treatment;
  static const Field<DiagnosesDto, String> _f$treatment =
      Field('treatment', _$treatment);
  static DateTime _$date(DiagnosesDto v) => v.date;
  static const Field<DiagnosesDto, DateTime> _f$date = Field('date', _$date);

  @override
  final MappableFields<DiagnosesDto> fields = const {
    #patientDiagnosis: _f$patientDiagnosis,
    #treatment: _f$treatment,
    #date: _f$date,
  };

  static DiagnosesDto _instantiate(DecodingData data) {
    return DiagnosesDto(
        patientDiagnosis: data.dec(_f$patientDiagnosis),
        treatment: data.dec(_f$treatment),
        date: data.dec(_f$date));
  }

  @override
  final Function instantiate = _instantiate;

  static DiagnosesDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DiagnosesDto>(map);
  }

  static DiagnosesDto fromJson(String json) {
    return ensureInitialized().decodeJson<DiagnosesDto>(json);
  }
}

mixin DiagnosesDtoMappable {
  String toJson() {
    return DiagnosesDtoMapper.ensureInitialized()
        .encodeJson<DiagnosesDto>(this as DiagnosesDto);
  }

  Map<String, dynamic> toMap() {
    return DiagnosesDtoMapper.ensureInitialized()
        .encodeMap<DiagnosesDto>(this as DiagnosesDto);
  }

  DiagnosesDtoCopyWith<DiagnosesDto, DiagnosesDto, DiagnosesDto> get copyWith =>
      _DiagnosesDtoCopyWithImpl<DiagnosesDto, DiagnosesDto>(
          this as DiagnosesDto, $identity, $identity);
  @override
  String toString() {
    return DiagnosesDtoMapper.ensureInitialized()
        .stringifyValue(this as DiagnosesDto);
  }

  @override
  bool operator ==(Object other) {
    return DiagnosesDtoMapper.ensureInitialized()
        .equalsValue(this as DiagnosesDto, other);
  }

  @override
  int get hashCode {
    return DiagnosesDtoMapper.ensureInitialized()
        .hashValue(this as DiagnosesDto);
  }
}

extension DiagnosesDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DiagnosesDto, $Out> {
  DiagnosesDtoCopyWith<$R, DiagnosesDto, $Out> get $asDiagnosesDto =>
      $base.as((v, t, t2) => _DiagnosesDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DiagnosesDtoCopyWith<$R, $In extends DiagnosesDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? patientDiagnosis, String? treatment, DateTime? date});
  DiagnosesDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DiagnosesDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DiagnosesDto, $Out>
    implements DiagnosesDtoCopyWith<$R, DiagnosesDto, $Out> {
  _DiagnosesDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DiagnosesDto> $mapper =
      DiagnosesDtoMapper.ensureInitialized();
  @override
  $R call({String? patientDiagnosis, String? treatment, DateTime? date}) =>
      $apply(FieldCopyWithData({
        if (patientDiagnosis != null) #patientDiagnosis: patientDiagnosis,
        if (treatment != null) #treatment: treatment,
        if (date != null) #date: date
      }));
  @override
  DiagnosesDto $make(CopyWithData data) => DiagnosesDto(
      patientDiagnosis:
          data.get(#patientDiagnosis, or: $value.patientDiagnosis),
      treatment: data.get(#treatment, or: $value.treatment),
      date: data.get(#date, or: $value.date));

  @override
  DiagnosesDtoCopyWith<$R2, DiagnosesDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DiagnosesDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class VitalsSignsDtoMapper extends ClassMapperBase<VitalsSignsDto> {
  VitalsSignsDtoMapper._();

  static VitalsSignsDtoMapper? _instance;
  static VitalsSignsDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VitalsSignsDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'VitalsSignsDto';

  static double? _$oxygenLevel(VitalsSignsDto v) => v.oxygenLevel;
  static const Field<VitalsSignsDto, double> _f$oxygenLevel =
      Field('oxygenLevel', _$oxygenLevel, opt: true);
  static double? _$bodyTemperature(VitalsSignsDto v) => v.bodyTemperature;
  static const Field<VitalsSignsDto, double> _f$bodyTemperature =
      Field('bodyTemperature', _$bodyTemperature, opt: true);
  static int? _$heartRate(VitalsSignsDto v) => v.heartRate;
  static const Field<VitalsSignsDto, int> _f$heartRate =
      Field('heartRate', _$heartRate, opt: true);
  static DateTime? _$createdAt(VitalsSignsDto v) => v.createdAt;
  static const Field<VitalsSignsDto, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);

  @override
  final MappableFields<VitalsSignsDto> fields = const {
    #oxygenLevel: _f$oxygenLevel,
    #bodyTemperature: _f$bodyTemperature,
    #heartRate: _f$heartRate,
    #createdAt: _f$createdAt,
  };

  static VitalsSignsDto _instantiate(DecodingData data) {
    return VitalsSignsDto(
        oxygenLevel: data.dec(_f$oxygenLevel),
        bodyTemperature: data.dec(_f$bodyTemperature),
        heartRate: data.dec(_f$heartRate),
        createdAt: data.dec(_f$createdAt));
  }

  @override
  final Function instantiate = _instantiate;

  static VitalsSignsDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VitalsSignsDto>(map);
  }

  static VitalsSignsDto fromJson(String json) {
    return ensureInitialized().decodeJson<VitalsSignsDto>(json);
  }
}

mixin VitalsSignsDtoMappable {
  String toJson() {
    return VitalsSignsDtoMapper.ensureInitialized()
        .encodeJson<VitalsSignsDto>(this as VitalsSignsDto);
  }

  Map<String, dynamic> toMap() {
    return VitalsSignsDtoMapper.ensureInitialized()
        .encodeMap<VitalsSignsDto>(this as VitalsSignsDto);
  }

  VitalsSignsDtoCopyWith<VitalsSignsDto, VitalsSignsDto, VitalsSignsDto>
      get copyWith =>
          _VitalsSignsDtoCopyWithImpl<VitalsSignsDto, VitalsSignsDto>(
              this as VitalsSignsDto, $identity, $identity);
  @override
  String toString() {
    return VitalsSignsDtoMapper.ensureInitialized()
        .stringifyValue(this as VitalsSignsDto);
  }

  @override
  bool operator ==(Object other) {
    return VitalsSignsDtoMapper.ensureInitialized()
        .equalsValue(this as VitalsSignsDto, other);
  }

  @override
  int get hashCode {
    return VitalsSignsDtoMapper.ensureInitialized()
        .hashValue(this as VitalsSignsDto);
  }
}

extension VitalsSignsDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VitalsSignsDto, $Out> {
  VitalsSignsDtoCopyWith<$R, VitalsSignsDto, $Out> get $asVitalsSignsDto =>
      $base.as((v, t, t2) => _VitalsSignsDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class VitalsSignsDtoCopyWith<$R, $In extends VitalsSignsDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {double? oxygenLevel,
      double? bodyTemperature,
      int? heartRate,
      DateTime? createdAt});
  VitalsSignsDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _VitalsSignsDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VitalsSignsDto, $Out>
    implements VitalsSignsDtoCopyWith<$R, VitalsSignsDto, $Out> {
  _VitalsSignsDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VitalsSignsDto> $mapper =
      VitalsSignsDtoMapper.ensureInitialized();
  @override
  $R call(
          {Object? oxygenLevel = $none,
          Object? bodyTemperature = $none,
          Object? heartRate = $none,
          Object? createdAt = $none}) =>
      $apply(FieldCopyWithData({
        if (oxygenLevel != $none) #oxygenLevel: oxygenLevel,
        if (bodyTemperature != $none) #bodyTemperature: bodyTemperature,
        if (heartRate != $none) #heartRate: heartRate,
        if (createdAt != $none) #createdAt: createdAt
      }));
  @override
  VitalsSignsDto $make(CopyWithData data) => VitalsSignsDto(
      oxygenLevel: data.get(#oxygenLevel, or: $value.oxygenLevel),
      bodyTemperature: data.get(#bodyTemperature, or: $value.bodyTemperature),
      heartRate: data.get(#heartRate, or: $value.heartRate),
      createdAt: data.get(#createdAt, or: $value.createdAt));

  @override
  VitalsSignsDtoCopyWith<$R2, VitalsSignsDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _VitalsSignsDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PatientAnalysisRequestMapper
    extends ClassMapperBase<PatientAnalysisRequest> {
  PatientAnalysisRequestMapper._();

  static PatientAnalysisRequestMapper? _instance;
  static PatientAnalysisRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PatientAnalysisRequestMapper._());
      VitalsSignsDtoMapper.ensureInitialized();
      DiagnosesDtoMapper.ensureInitialized();
      PatientDtoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PatientAnalysisRequest';

  static List<VitalsSignsDto> _$vitals(PatientAnalysisRequest v) => v.vitals;
  static const Field<PatientAnalysisRequest, List<VitalsSignsDto>> _f$vitals =
      Field('vitals', _$vitals);
  static List<DiagnosesDto> _$diagnoses(PatientAnalysisRequest v) =>
      v.diagnoses;
  static const Field<PatientAnalysisRequest, List<DiagnosesDto>> _f$diagnoses =
      Field('diagnoses', _$diagnoses);
  static PatientDto _$patient(PatientAnalysisRequest v) => v.patient;
  static const Field<PatientAnalysisRequest, PatientDto> _f$patient =
      Field('patient', _$patient);

  @override
  final MappableFields<PatientAnalysisRequest> fields = const {
    #vitals: _f$vitals,
    #diagnoses: _f$diagnoses,
    #patient: _f$patient,
  };

  static PatientAnalysisRequest _instantiate(DecodingData data) {
    return PatientAnalysisRequest(
        vitals: data.dec(_f$vitals),
        diagnoses: data.dec(_f$diagnoses),
        patient: data.dec(_f$patient));
  }

  @override
  final Function instantiate = _instantiate;

  static PatientAnalysisRequest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PatientAnalysisRequest>(map);
  }

  static PatientAnalysisRequest fromJson(String json) {
    return ensureInitialized().decodeJson<PatientAnalysisRequest>(json);
  }
}

mixin PatientAnalysisRequestMappable {
  String toJson() {
    return PatientAnalysisRequestMapper.ensureInitialized()
        .encodeJson<PatientAnalysisRequest>(this as PatientAnalysisRequest);
  }

  Map<String, dynamic> toMap() {
    return PatientAnalysisRequestMapper.ensureInitialized()
        .encodeMap<PatientAnalysisRequest>(this as PatientAnalysisRequest);
  }

  PatientAnalysisRequestCopyWith<PatientAnalysisRequest, PatientAnalysisRequest,
          PatientAnalysisRequest>
      get copyWith => _PatientAnalysisRequestCopyWithImpl<
              PatientAnalysisRequest, PatientAnalysisRequest>(
          this as PatientAnalysisRequest, $identity, $identity);
  @override
  String toString() {
    return PatientAnalysisRequestMapper.ensureInitialized()
        .stringifyValue(this as PatientAnalysisRequest);
  }

  @override
  bool operator ==(Object other) {
    return PatientAnalysisRequestMapper.ensureInitialized()
        .equalsValue(this as PatientAnalysisRequest, other);
  }

  @override
  int get hashCode {
    return PatientAnalysisRequestMapper.ensureInitialized()
        .hashValue(this as PatientAnalysisRequest);
  }
}

extension PatientAnalysisRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PatientAnalysisRequest, $Out> {
  PatientAnalysisRequestCopyWith<$R, PatientAnalysisRequest, $Out>
      get $asPatientAnalysisRequest => $base.as((v, t, t2) =>
          _PatientAnalysisRequestCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PatientAnalysisRequestCopyWith<
    $R,
    $In extends PatientAnalysisRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, VitalsSignsDto,
      VitalsSignsDtoCopyWith<$R, VitalsSignsDto, VitalsSignsDto>> get vitals;
  ListCopyWith<$R, DiagnosesDto,
      DiagnosesDtoCopyWith<$R, DiagnosesDto, DiagnosesDto>> get diagnoses;
  PatientDtoCopyWith<$R, PatientDto, PatientDto> get patient;
  $R call(
      {List<VitalsSignsDto>? vitals,
      List<DiagnosesDto>? diagnoses,
      PatientDto? patient});
  PatientAnalysisRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PatientAnalysisRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PatientAnalysisRequest, $Out>
    implements
        PatientAnalysisRequestCopyWith<$R, PatientAnalysisRequest, $Out> {
  _PatientAnalysisRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PatientAnalysisRequest> $mapper =
      PatientAnalysisRequestMapper.ensureInitialized();
  @override
  ListCopyWith<$R, VitalsSignsDto,
          VitalsSignsDtoCopyWith<$R, VitalsSignsDto, VitalsSignsDto>>
      get vitals => ListCopyWith($value.vitals, (v, t) => v.copyWith.$chain(t),
          (v) => call(vitals: v));
  @override
  ListCopyWith<$R, DiagnosesDto,
          DiagnosesDtoCopyWith<$R, DiagnosesDto, DiagnosesDto>>
      get diagnoses => ListCopyWith($value.diagnoses,
          (v, t) => v.copyWith.$chain(t), (v) => call(diagnoses: v));
  @override
  PatientDtoCopyWith<$R, PatientDto, PatientDto> get patient =>
      $value.patient.copyWith.$chain((v) => call(patient: v));
  @override
  $R call(
          {List<VitalsSignsDto>? vitals,
          List<DiagnosesDto>? diagnoses,
          PatientDto? patient}) =>
      $apply(FieldCopyWithData({
        if (vitals != null) #vitals: vitals,
        if (diagnoses != null) #diagnoses: diagnoses,
        if (patient != null) #patient: patient
      }));
  @override
  PatientAnalysisRequest $make(CopyWithData data) => PatientAnalysisRequest(
      vitals: data.get(#vitals, or: $value.vitals),
      diagnoses: data.get(#diagnoses, or: $value.diagnoses),
      patient: data.get(#patient, or: $value.patient));

  @override
  PatientAnalysisRequestCopyWith<$R2, PatientAnalysisRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PatientAnalysisRequestCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class NewDiagnosisDtoMapper extends ClassMapperBase<NewDiagnosisDto> {
  NewDiagnosisDtoMapper._();

  static NewDiagnosisDtoMapper? _instance;
  static NewDiagnosisDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NewDiagnosisDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NewDiagnosisDto';

  static String _$patientDiagnosis(NewDiagnosisDto v) => v.patientDiagnosis;
  static const Field<NewDiagnosisDto, String> _f$patientDiagnosis =
      Field('patientDiagnosis', _$patientDiagnosis);
  static String _$patientId(NewDiagnosisDto v) => v.patientId;
  static const Field<NewDiagnosisDto, String> _f$patientId =
      Field('patientId', _$patientId);
  static String _$doctorId(NewDiagnosisDto v) => v.doctorId;
  static const Field<NewDiagnosisDto, String> _f$doctorId =
      Field('doctorId', _$doctorId);
  static String _$treatment(NewDiagnosisDto v) => v.treatment;
  static const Field<NewDiagnosisDto, String> _f$treatment =
      Field('treatment', _$treatment);

  @override
  final MappableFields<NewDiagnosisDto> fields = const {
    #patientDiagnosis: _f$patientDiagnosis,
    #patientId: _f$patientId,
    #doctorId: _f$doctorId,
    #treatment: _f$treatment,
  };

  static NewDiagnosisDto _instantiate(DecodingData data) {
    return NewDiagnosisDto(
        patientDiagnosis: data.dec(_f$patientDiagnosis),
        patientId: data.dec(_f$patientId),
        doctorId: data.dec(_f$doctorId),
        treatment: data.dec(_f$treatment));
  }

  @override
  final Function instantiate = _instantiate;

  static NewDiagnosisDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NewDiagnosisDto>(map);
  }

  static NewDiagnosisDto fromJson(String json) {
    return ensureInitialized().decodeJson<NewDiagnosisDto>(json);
  }
}

mixin NewDiagnosisDtoMappable {
  String toJson() {
    return NewDiagnosisDtoMapper.ensureInitialized()
        .encodeJson<NewDiagnosisDto>(this as NewDiagnosisDto);
  }

  Map<String, dynamic> toMap() {
    return NewDiagnosisDtoMapper.ensureInitialized()
        .encodeMap<NewDiagnosisDto>(this as NewDiagnosisDto);
  }

  NewDiagnosisDtoCopyWith<NewDiagnosisDto, NewDiagnosisDto, NewDiagnosisDto>
      get copyWith =>
          _NewDiagnosisDtoCopyWithImpl<NewDiagnosisDto, NewDiagnosisDto>(
              this as NewDiagnosisDto, $identity, $identity);
  @override
  String toString() {
    return NewDiagnosisDtoMapper.ensureInitialized()
        .stringifyValue(this as NewDiagnosisDto);
  }

  @override
  bool operator ==(Object other) {
    return NewDiagnosisDtoMapper.ensureInitialized()
        .equalsValue(this as NewDiagnosisDto, other);
  }

  @override
  int get hashCode {
    return NewDiagnosisDtoMapper.ensureInitialized()
        .hashValue(this as NewDiagnosisDto);
  }
}

extension NewDiagnosisDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NewDiagnosisDto, $Out> {
  NewDiagnosisDtoCopyWith<$R, NewDiagnosisDto, $Out> get $asNewDiagnosisDto =>
      $base.as((v, t, t2) => _NewDiagnosisDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NewDiagnosisDtoCopyWith<$R, $In extends NewDiagnosisDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? patientDiagnosis,
      String? patientId,
      String? doctorId,
      String? treatment});
  NewDiagnosisDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NewDiagnosisDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NewDiagnosisDto, $Out>
    implements NewDiagnosisDtoCopyWith<$R, NewDiagnosisDto, $Out> {
  _NewDiagnosisDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NewDiagnosisDto> $mapper =
      NewDiagnosisDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? patientDiagnosis,
          String? patientId,
          String? doctorId,
          String? treatment}) =>
      $apply(FieldCopyWithData({
        if (patientDiagnosis != null) #patientDiagnosis: patientDiagnosis,
        if (patientId != null) #patientId: patientId,
        if (doctorId != null) #doctorId: doctorId,
        if (treatment != null) #treatment: treatment
      }));
  @override
  NewDiagnosisDto $make(CopyWithData data) => NewDiagnosisDto(
      patientDiagnosis:
          data.get(#patientDiagnosis, or: $value.patientDiagnosis),
      patientId: data.get(#patientId, or: $value.patientId),
      doctorId: data.get(#doctorId, or: $value.doctorId),
      treatment: data.get(#treatment, or: $value.treatment));

  @override
  NewDiagnosisDtoCopyWith<$R2, NewDiagnosisDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NewDiagnosisDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
