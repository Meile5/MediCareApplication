import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:medicare/common/auth/auth_prefs.dart';
import 'package:uuid/uuid.dart';

import '../models/vitals_models.dart';

class VitalsDataSource {
  final _uuid = const Uuid();
  Future<void> saveVitals(SaveVitalsDto vitals) async {
    final url = "${dotenv.env['API_BASE_URL']!}/device/saveVitals";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
      body: json.encode(vitals.toMap()),
    );
  }

  Future<String> pairDevice(String pairingCode) async {
    final url = "${dotenv.env['API_BASE_URL']!}/device/pair";
    final deviceId = _uuid.v4();

    final dto = ClientWantsToPairDeviceDto(
      PatientId: AuthPrefs.userId!,
      DeviceId: deviceId,
      PairingCode: pairingCode,
    );

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(dto.toMap()),
    );
    print(json.encode(dto.toMap()));

    if (response.statusCode != 200) {
      throw Exception("Pairing failed: ${response.body}");
    }

    return deviceId;
  }
}
