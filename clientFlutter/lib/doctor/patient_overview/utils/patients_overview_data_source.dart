import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../../common/auth/auth_prefs.dart';
import '../../../patient/common/patient_model.dart';
import '../models/patients_overview_models.dart';

class PatientsOverviewDataSource {


  Future<List<VitalsSignsDto>> getPatientVitals(patientId) async {
    final response = await http.get(
      Uri.parse("${dotenv.env['API_BASE_URL']!}/RetrievePatientsVitals?userId=$patientId"),
      headers: {'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!},
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => VitalsSignsDtoMapper.fromMap(e)).toList();
  }

  Future<List<DiagnosesDto>> getPatientsDiagnoses(patientId) async {
    final response = await http.get(
      Uri.parse("${dotenv.env['API_BASE_URL']!}/RetrievePatientsDiagnoses?userId=$patientId"),
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



}







