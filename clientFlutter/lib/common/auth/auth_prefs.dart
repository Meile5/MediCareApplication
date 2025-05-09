import 'package:shared_preferences/shared_preferences.dart';

class AuthPrefs {
 static late  SharedPreferences prefs;
  static Future<void> init() async {
     prefs = await SharedPreferences.getInstance();

  }
  static String? get jwt => prefs.getString('jwt');
static String? get userId => prefs.getString('userId');
  static String? get email => prefs.getString('email');
  static String? get role => prefs.getString('role');

  static set jwt(String? value) => prefs.setString('jwt', value!);
  static
  set userId(String? value) => prefs.setString('userId', value!);
  static set email(String? value) => prefs.setString('email', value!);
 static set role(String? value) => prefs.setString('role', value!);
}