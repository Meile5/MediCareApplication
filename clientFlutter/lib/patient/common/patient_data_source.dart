import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medicare/patient/common/patient_model.dart';

import '../../common/auth/auth_prefs.dart';

class PatientDataSource {
  Future<PatientDto> getPatientById(String patientId) async {
    final url = 'http://localhost:5000/patient/getPatient';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json', 'Authorization':  AuthPrefs.jwt!},
      body: json.encode({'patientId': patientId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch patient: ${response.statusCode}');
    }

    final jsonMap = json.decode(response.body);
    return PatientDtoMapper.fromMap(jsonMap);
  }
}
