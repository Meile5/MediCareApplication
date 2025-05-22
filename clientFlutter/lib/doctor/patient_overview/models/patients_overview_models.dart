import 'package:dart_mappable/dart_mappable.dart';

import '../../../patient/common/patient_model.dart';
part 'patients_overview_models.mapper.dart';

@MappableClass()
class DiagnosesDto with DiagnosesDtoMappable {
  final String patientDiagnosis;
  final String treatment;
  final DateTime date;



  DiagnosesDto( {
    required this.patientDiagnosis,
    required this.treatment,
    required this.date,

  });

}


@MappableClass()
class VitalsSignsDto with VitalsSignsDtoMappable {
  final double? oxygenLevel;
  final double? bodyTemperature;
  final int? heartRate;
  final DateTime? createdAt;

  VitalsSignsDto({
    this.oxygenLevel,
    this.bodyTemperature,
    this.heartRate,
    this.createdAt,
  });
}

@MappableClass()
class PatientAnalysisRequest with PatientAnalysisRequestMappable {
  final List<VitalsSignsDto> vitals;
  final List<DiagnosesDto> diagnoses;
  final PatientDto patient;

  PatientAnalysisRequest({
    required this.vitals,
    required this.diagnoses,
    required this.patient,
  });

}
@MappableClass()
class NewDiagnosisDto with NewDiagnosisDtoMappable {
  final String patientDiagnosis;
  final String patientId;
  final String doctorId;
  final String treatment;

  NewDiagnosisDto({
    required this.patientDiagnosis,
    required this.patientId,
    required this.doctorId,
    required this.treatment,
  });




}