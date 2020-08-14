part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthWelcome extends AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class AuthWelcomeSuccess extends AuthState {}

class UserLogedIn extends AuthState {}

class UserNewPassword extends AuthState {
  final String username;
  final String password;

  UserNewPassword({this.username, this.password});
}

class UserLoggedOut extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({@required this.message});
}
