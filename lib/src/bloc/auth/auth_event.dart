// Events
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String userId;
  final String password;

  LoginEvent({required this.userId, required this.password});
}
