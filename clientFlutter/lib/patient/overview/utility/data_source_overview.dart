import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:medicare/common/auth/auth_prefs.dart';
import '../models/models_overview.dart';
import 'package:uri/uri.dart';

class DataSourceOverview {
  Future<List<ClinicInfoDto>> retrieveClinicInfo() async {
    final url = dotenv.env['API_BASE_URL']! + "/RetrieveClinicInfo?userId=${AuthPrefs.userId}";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json', 'Authorization': AuthPrefs.jwt!,
      },
      //body: json.encode(AuthPrefs.userId),
    );

    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((e) => ClinicInfoDtoMapper.fromMap(e)).toList();

  }

}