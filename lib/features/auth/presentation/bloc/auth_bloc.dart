import 'dart:async';

import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/auth/domain/usecases/check_first_time.dart';
import 'package:Attendit/features/auth/domain/usecases/check_session.dart';
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
  final CheckSession checkSession;
  final CheckFirstTime checkFirstTime;

  AuthBloc(this.userLogin, this.checkSession, this.checkFirstTime);
  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield LoginLoading();
      final failureOrSucess = await userLogin(Params(
          userType: event.userType,
          username: event.username,
          password: event.password));
      yield* _eitherLoadedOrErrorState(failureOrSucess);
    }
    if (event is CheckSessionEvent) {
      yield LoginLoading();
      final welcome =
          (await checkFirstTime(NoParams())).fold((l) => null, (r) => r);
      if (welcome == false) {
        yield AuthWelcome();
      } else {
        final failureOrSucess = await checkSession(NoParams());
        yield* _eitherLoadedOrErrorState(failureOrSucess);
      }
    }
    if (event is InitialEvent) {
      yield AuthWelcomeSuccess();
    }
  }

  Stream<AuthState> _eitherLoadedOrErrorState(
    Either<Failure, bool> failureOrSuccess,
  ) async* {
    final res = failureOrSuccess.fold(
      (failure) => AuthError(message: _mapFailureToMessage(failure)),
      (_) => UserLogedIn(),
    );
    yield res;
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      case UnauthorizedFailure:
        return UNAUTHORIZED_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
