import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models_appointments.dart';
import 'models_for_mapping.dart';

class DataSource {
  Future<DoctorAvailabilityResponseDto> getAvailability(String doctorId) async {

    final url = "http://localhost:5000/RetrieveBookingInfo";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(doctorId),
    );
    // Check if the response is successful
    if (response.statusCode != 200) {
      throw Exception('Failed to load availability data: ${response.statusCode}');
    }
    final map = json.decode(response.body);
    return DoctorAvailabilityResponseDto.fromJson(map);
  }

  Future<http.Response> bookAppointment(BookAppointmentDto dto) async {
    final jsonBody = json.encode(dto.toMap()); // Encode payload
    print('Request body: $jsonBody'); // Log payload

    final response = await http.post(
      Uri.parse('http://localhost:5000/BookAppointment'),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    return response;
  }

  Future<List<FutureAppointmentsDto>> getFutureAppointments(String userId) async {
    final response = await http.post(
      Uri.parse("http://localhost:5000/RetrieveFutureAppointments"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userId),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => FutureAppointmentsDtoMapper.fromMap(e)).toList();
  }




}







