import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../common/auth/auth_prefs.dart';
import '../../patient/overview/models/models_overview.dart';
import 'doctor_model.dart';

class DoctorDataSource {
  Future<DoctorDto> getDoctorById(String doctorId) async {
    final url =
        "${dotenv.env['API_BASE_URL']!}/doctor/getDoctor?doctorId=$doctorId";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
    );

    final jsonMap = json.decode(response.body);
    return DoctorDtoMapper.fromMap(jsonMap);
  }

  Future<List<ClinicInfoDto>> retrieveClinicInfo() async {
    final url =
        dotenv.env['API_BASE_URL']! +
        "/RetrieveClinicInfoForDoctor?userId=${AuthPrefs.userId}";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => ClinicInfoDtoMapper.fromMap(e)).toList();
  }
}
