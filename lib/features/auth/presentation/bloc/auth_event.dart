part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String prefix;
  final String userType;
  final String username;
  final String password;

  LoginEvent({this.prefix, this.userType, this.username, this.password});

  @override
  List<Object> get props => [prefix, userType, username, password];
}

class LogoutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
