import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../../common/auth/auth_prefs.dart';
import '../../../patient/common/patient_model.dart';
import '../models/patients_overview_models.dart';

class PatientsOverviewDataSource {


  Future<List<VitalsSignsDto>> getPatientVitals(patientId) async {
    final response = await http.get(
      Uri.parse("${dotenv.env['API_BASE_URL']!}/RetrievePatientsVitals?patientId=$patientId"),
      headers: {'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!},
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => VitalsSignsDtoMapper.fromMap(e)).toList();
  }

  Future<List<DiagnosesDto>> getPatientsDiagnoses(patientId) async {
    final response = await http.get(
      Uri.parse("${dotenv.env['API_BASE_URL']!}/RetrievePatientsDiagnoses?patientId=$patientId"),
      headers: {'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!},
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => DiagnosesDtoMapper.fromMap(e)).toList();
  }

  Future<List<PatientDto>> getPatients(clinicId) async {
    final response = await http.get(
      Uri.parse("${dotenv.env['API_BASE_URL']!}/RetrievePatients?clinicId=$clinicId"),
      headers: {'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!},
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => PatientDtoMapper.fromMap(e)).toList();
  }

  Future<Uint8List> handlePdf(PatientAnalysisRequest patientAnalysisRequest) async {
    final url = Uri.parse('http://127.0.0.1:8000/analyze');
    final jsonPayload = jsonEncode(patientAnalysisRequest);

    print('Sending JSON payload: $jsonPayload');

    final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonPayload,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to fetch PDF: ${response.statusCode}');
    }

}



}







