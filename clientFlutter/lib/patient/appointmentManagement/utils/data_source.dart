import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../common/auth/auth_prefs.dart';
import '../models/models_for_mapping.dart';

class DataSource {
  Future<List<AvailabilityDto>> getAvailability(String doctorId) async {

    final url = "http://localhost:5000/RetrieveBookingInfo";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(doctorId),
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => AvailabilityDtoMapper.fromMap(e)).toList();
  }

  Future<http.Response> bookAppointment(BookAppointmentRequest dto) async {
    final jsonBody = json.encode(dto.toMap());

    final response = await http.post(
      Uri.parse('http://localhost:5000/BookAppointment'),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    return response;
  }

  Future<List<FutureAppointmentsDto>> getFutureAppointments() async {
    final response = await http.post(
      Uri.parse("http://localhost:5000/RetrieveFutureAppointments"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(AuthPrefs.userId),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => FutureAppointmentsDtoMapper.fromMap(e)).toList();
  }

  Future<List<PastAppointmentsDto>> getPastAppointments() async {
    final response = await http.post(
      Uri.parse("http://localhost:5000/RetrievePastAppointments"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(AuthPrefs.userId),
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => PastAppointmentsDtoMapper.fromMap(e)).toList();
  }
  Future<http.Response> cancelAppointments(CancelAppointmentDto dto) async {
    final response = await http.post(
      Uri.parse("http://localhost:5000/CancelAppointment"),
      headers: {'Content-Type': 'application/json'},
        body: json.encode(dto.toMap())
    );
    return response;
  }
  Future<List<ClinicDoctorDto>> getDoctors(String clinicId) async {
    final response = await http.post(
      Uri.parse("http://localhost:5000/RetrieveDoctors"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(clinicId),
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => ClinicDoctorDtoMapper.fromMap(e)).toList();
  }




}







