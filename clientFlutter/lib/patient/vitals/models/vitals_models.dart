import 'package:dart_mappable/dart_mappable.dart';

part 'vitals_models.mapper.dart';

@MappableClass()
class SaveVitalsDto with SaveVitalsDtoMappable {
  final String PatientId;
  final double Temperature;
  final double? OxygenLevel;
  final List<int> Ecg;
  final int? HeartRate;

  SaveVitalsDto({
    required this.PatientId,
    required this.Temperature,
    required this.OxygenLevel,
    required this.Ecg,
    required this.HeartRate,
  });
}

@MappableClass()
class ClientWantsToPairDeviceDto with ClientWantsToPairDeviceDtoMappable {
  final String PatientId;
  final String DeviceId;
  final String PairingCode;

  ClientWantsToPairDeviceDto({
    required this.PatientId,
    required this.DeviceId,
    required this.PairingCode,
  });
}
