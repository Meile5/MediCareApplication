import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/auth/auth_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loadAuth() async {
    final jwt = AuthPrefs.jwt;
    final userId = AuthPrefs.userId;
    final email = AuthPrefs.email;
    final role = AuthPrefs.role;

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
    AuthPrefs.jwt = jwt;
    AuthPrefs.userId = userId;
    AuthPrefs.email = email;
    AuthPrefs.role = role;

    emit(Authenticated(jwt: jwt, userId: userId, email: email, role: role));
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    emit(Unauthenticated());
  }
}
