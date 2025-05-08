import 'package:dart_mappable/dart_mappable.dart';

part 'patient_model.mapper.dart';

@MappableClass()
class PatientDto with PatientDtoMappable {
  final String userid;
  final String name;
  final String surname;
  final String gender;
  final String age;
  final String bloodtype;
  final String? allergies;
  final String phonenumber;
  final String address;
  final String? deviceId;

  PatientDto({
    required this.userid,
    required this.name,
    required this.surname,
    required this.gender,
    required this.age,
    required this.bloodtype,
    this.allergies,
    required this.phonenumber,
    required this.address,
    this.deviceId,
  });
}
