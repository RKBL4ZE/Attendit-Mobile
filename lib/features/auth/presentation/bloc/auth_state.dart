part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthWelcome extends AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class AuthWelcomeSuccess extends AuthState {}

class UserLogedIn extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({@required this.message});

  @override
  List<Object> get props => [message];
}
