class AuthService {
  String? _jwt;
  String? _userId;
  String? _email;

  String? get jwt => _jwt;
  String? get userId => _userId;
  String? get email => _email;

  void saveAuth({
    required String jwt,
    required String userId,
    required String email,
  }) {
    _jwt = jwt;
    _userId = userId;
    _email = email;
  }

  void clearAuth() {
    _jwt = null;
    _userId = null;
    _email = null;
  }

  bool get isAuthenticated => _jwt != null;
}
