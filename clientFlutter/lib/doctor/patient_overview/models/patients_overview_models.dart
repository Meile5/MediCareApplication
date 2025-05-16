import 'package:dart_mappable/dart_mappable.dart';
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