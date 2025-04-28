import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models_appointments.dart';

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

 /* Future<DoctorAvailabilityResponseDto> getAvailability(String doctorId) async {

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
  }*/

}







