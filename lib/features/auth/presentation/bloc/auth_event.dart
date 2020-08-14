part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String userType;
  final String username;
  final String password;

  LoginEvent({this.userType, this.username, this.password});
}

class ErrorEvent extends AuthEvent {
  final String message;

  ErrorEvent(this.message);
}

class LogoutEvent extends AuthEvent {}

class InitialEvent extends AuthEvent {}

class CheckSessionEvent extends AuthEvent {}

class NewPasswordEvent extends AuthEvent {}
