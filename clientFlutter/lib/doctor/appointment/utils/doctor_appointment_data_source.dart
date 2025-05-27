import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:medicare/doctor/appointment/models/appointment_model.dart';

import '../../../common/auth/auth_prefs.dart';

class DoctorAppointmentDataSource {
  Future<List<AppointmentDoctorSideDto>> getAppointmentsForDoctor() async {
    final url =
        "${dotenv.env['API_BASE_URL']!}/appointments/getAppointments?doctorId=${AuthPrefs.userId}";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
    );

    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((e) => AppointmentDoctorSideDtoMapper.fromMap(e)).toList();
  }

  Future<void> confirmAppointment(String appointmentId, String patientId) async {
    final url =
        "${dotenv.env['API_BASE_URL']!}/appointments/confirm?appointmentId=$appointmentId&roomId=${AuthPrefs.userId}-$patientId";

    await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
    );
  }

  Future<void> rejectAppointment(String appointmentId, String patientId) async {
    final url =
        "${dotenv.env['API_BASE_URL']!}/appointments/reject?appointmentId=$appointmentId&doctorId=${AuthPrefs.userId}-$patientId";

    await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
    );
  }

  Future<String> getPatientName(String appointmentId) async {
    final url =
        "${dotenv.env['API_BASE_URL']!}/appointments/getPatientName?appointmentId=$appointmentId";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
    );

    if (response.statusCode == 200) {
      return response.body.replaceAll('"', '');
    } else {
      throw Exception("Failed to fetch patient name");
    }
  }

  Future<void> createChatRoom(CreateChatRoomDto chatroom) async {
    final url =
        "${dotenv.env['API_BASE_URL']!}/appointments/confirm/createChatRoom";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
      body: json.encode(chatroom.toMap()),
    );
  }
}
