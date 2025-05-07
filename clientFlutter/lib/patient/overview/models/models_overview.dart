import 'package:dart_mappable/dart_mappable.dart';

part 'models_overview.mapper.dart';

@MappableClass()
class ClinicInfoDto with ClinicInfoDtoMappable {
  final String clinicname;
  final String address;
  final String phonenumber;
  final String type;

  ClinicInfoDto( {
    required this.clinicname,
    required this.address,
    required this.phonenumber,
    required this.type,
  });

}