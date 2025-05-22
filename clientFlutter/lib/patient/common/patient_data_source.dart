import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:medicare/patient/common/patient_model.dart';

import '../../common/auth/auth_prefs.dart';

class PatientDataSource {
  Future<PatientDto> getPatientById(String patientId) async {

    final url = "${dotenv.env['API_BASE_URL']!}/patient/getPatient?patientId=$patientId";
    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json', 'Authorization':  AuthPrefs.jwt!},
    );

    final jsonMap = json.decode(response.body);
    return PatientDtoMapper.fromMap(jsonMap);
  }
}
