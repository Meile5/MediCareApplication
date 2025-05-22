import 'package:dart_mappable/dart_mappable.dart';

part 'doctor_model.mapper.dart';

@MappableClass()
class DoctorDto with DoctorDtoMappable {
  final String doctorid;
  final String name;
  final String surname;
  final String gender;
  final String age;
  final String specialty;

  DoctorDto({
    required this.doctorid,
    required this.name,
    required this.surname,
    required this.gender,
    required this.age,
    required this.specialty,
  });
}
