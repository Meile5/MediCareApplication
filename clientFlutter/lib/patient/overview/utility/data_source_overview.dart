import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medicare/common/auth/auth_prefs.dart';
import '../models/models_overview.dart';


class DataSourceOverview {
  Future<List<ClinicInfoDto>> retrieveClinicInfo() async {
    final url = "http://localhost:5000/RetrieveClinicInfo";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(AuthPrefs.userId),
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => ClinicInfoDtoMapper.fromMap(e)).toList();

  }

}