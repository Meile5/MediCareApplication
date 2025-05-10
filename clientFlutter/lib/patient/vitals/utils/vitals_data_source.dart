import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medicare/common/auth/auth_prefs.dart';

import '../models/vitals_models.dart';

class VitalsDataSource {
  final String _baseUrl = 'http://localhost:5000';

  Future<void> saveVitals(SaveVitalsDto vitals) async {
    final url = '$_baseUrl/device/saveVitals';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': AuthPrefs.jwt!,
      },
      body: json.encode(vitals.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to save vitals: ${response.statusCode}');
    }
  }
}
