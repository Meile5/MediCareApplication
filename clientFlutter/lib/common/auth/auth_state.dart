abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final String jwt;
  final String userId;
  final String email;
  final String role;

  Authenticated({
    required this.jwt,
    required this.userId,
    required this.email,
    required this.role,
  });
}

class Unauthenticated extends AuthState {}
