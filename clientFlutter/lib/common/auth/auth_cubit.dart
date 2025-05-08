import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loadAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final jwt = prefs.getString('jwt');
    final userId = prefs.getString('userId');
    final email = prefs.getString('email');
    final role = prefs.getString('role');

    if (jwt != null && userId != null && email != null && role != null) {
      emit(Authenticated(jwt: jwt, userId: userId, email: email, role: role));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> saveAuth({
    required String jwt,
    required String userId,
    required String email,
    required String role,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', jwt);
    await prefs.setString('userId', userId);
    await prefs.setString('email', email);
    await prefs.setString('role', role);

    emit(Authenticated(jwt: jwt, userId: userId, email: email, role: role));
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    emit(Unauthenticated());
  }
}
