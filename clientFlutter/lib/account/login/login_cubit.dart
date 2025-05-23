import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../common/auth/auth_cubit.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthCubit authCubit;

  LoginCubit(this.authCubit) : super(LoginReady());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final response = await http.post(
        Uri.parse("${dotenv.env['API_BASE_URL']!}/Login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final jwt = data['jwt'];

        final parts = jwt.split('.');
        final payload = json.decode(
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
        );

        final userId = payload['Id'];
        final userEmail = payload['Email'];
        final userRole = payload['Role'];

        await authCubit.saveAuth(
          jwt: jwt,
          userId: userId,
          email: userEmail,
          role: userRole,
        );

        emit(
          LoggedIn(jwt: jwt, userId: userId, email: userEmail, role: userRole),
        );
      } else {
        emit(LoginError('Login failed: ${response.statusCode}'));
      }
    } catch (e) {
      emit(LoginError('Login error: $e'));
    }
  }
}
