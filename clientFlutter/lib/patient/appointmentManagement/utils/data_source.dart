import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../../common/auth/auth_prefs.dart';
import '../models/models_for_mapping.dart';

class DataSource {
  Future<List<AvailabilityDto>> getAvailability(String doctorId) async {
    final url = "${dotenv.env['API_BASE_URL']!}/RetrieveBookingInfo?doctorId=$doctorId";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!,
      },

    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => AvailabilityDtoMapper.fromMap(e)).toList();
  }

  Future<http.Response> bookAppointment(BookAppointmentRequest dto) async {
    final jsonBody = json.encode(dto.toMap());

    final response = await http.post(

    Uri.parse("${dotenv.env['API_BASE_URL']!}/BookAppointment"),
      headers: {'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!},
      body: jsonBody,
    );

    return response;
  }

  Future<List<FutureAppointmentsDto>> getFutureAppointments() async {
    final response = await http.get(
      Uri.parse("${dotenv.env['API_BASE_URL']!}/RetrieveFutureAppointments?userId=${AuthPrefs.userId}"),
      headers: {'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!},
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => FutureAppointmentsDtoMapper.fromMap(e)).toList();
  }

  Future<List<PastAppointmentsDto>> getPastAppointments() async {
    final response = await http.get(
      Uri.parse("${dotenv.env['API_BASE_URL']!}/RetrievePastAppointments?userId=${AuthPrefs.userId}"),
      headers: {'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!},
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => PastAppointmentsDtoMapper.fromMap(e)).toList();
  }
  Future<http.Response> cancelAppointments(CancelAppointmentDto dto) async {
    final response = await http.delete(
      Uri.parse("${dotenv.env['API_BASE_URL']!}/CancelAppointment"),
      headers: {'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!},
        body: json.encode(dto.toMap())
    );
    return response;
  }
  Future<List<ClinicDoctorDto>> getDoctors(String clinicId) async {
    final response = await http.get(
      Uri.parse("${dotenv.env['API_BASE_URL']!}/RetrieveDoctors?clinicId=$clinicId"),
      headers: {'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!},
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => ClinicDoctorDtoMapper.fromMap(e)).toList();
  }




}







