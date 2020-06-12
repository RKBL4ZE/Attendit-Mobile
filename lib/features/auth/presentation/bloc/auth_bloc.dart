import 'dart:async';

import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/auth/domain/usecases/user_login.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';



//part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';


const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNAUTHORIZED_FAILURE_MESSAGE = 'Invalid Crendentials';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin userLogin;

  AuthBloc(this.userLogin);
  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield LoginLoading();
      print(event.username);
      print(event.password);
      print(event.prefix);
      print(event.userType);
      final failureOrSucess = await userLogin(Params(
          prefix: event.prefix,
          userType: event.userType,
          username: event.username,
          password: event.password));
      yield* _eitherLoadedOrErrorState(failureOrSucess);
    }
  }

  Stream<AuthState> _eitherLoadedOrErrorState(
    Either<Failure, bool> failureOrSuccess,
  ) async* {
    yield failureOrSuccess.fold(
      (failure) => AuthError(message: _mapFailureToMessage(failure)),
      (_) => UserLogedIn(),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      case  UnauthorizedFailure:
        return UNAUTHORIZED_FAILURE_MESSAGE;  
      default:
        return 'Unexpected error';

    }
  }
}
