import 'package:dart_mappable/dart_mappable.dart';

part 'models_overview.mapper.dart';

@MappableClass()
class ClinicInfoDto with ClinicInfoDtoMappable {
  final String id;
  final String clinicname;
  final String address;
  final String phonenumber;
  final String type;

  ClinicInfoDto( {
    required this.id,
    required this.clinicname,
    required this.address,
    required this.phonenumber,
    required this.type,
  });

}