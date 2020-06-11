import 'dart:async';

import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/auth/domain/usecases/user_login.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

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
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (_) => UserLogedIn(),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
