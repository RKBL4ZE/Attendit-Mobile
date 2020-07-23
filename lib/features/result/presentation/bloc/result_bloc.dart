import 'dart:async';

import 'package:Attendit/features/home/domain/usecases/get_enrollment.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/result.dart';
import '../../domain/usecases/get_result.dart';

part 'result_event.dart';
part 'result_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNAUTHORIZED_FAILURE_MESSAGE = 'Invalid Crendentials';

@injectable
class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final GetResult getResult;
  final GetEnrollment getEnrollment;

  ResultBloc(this.getResult, this.getEnrollment) {
    this.add(GetResultEvent());
  }

  @override
  ResultState get initialState => ResultInitial();
  @override
  Stream<ResultState> mapEventToState(
    ResultEvent event,
  ) async* {
    if (event is GetResultEvent) {
      final failureOrEnrollment = await getEnrollment(NoParams());
      final enrollment = failureOrEnrollment.fold((l) => null, (r) => r);

      final failureOrResult = await getResult(Params(enrollment: enrollment));
      yield* _eitherLoadedOrErrorState(failureOrResult);
    }
  }

  Stream<ResultState> _eitherLoadedOrErrorState(
    Either<Failure, ResultData> failureOrNewsFeed,
  ) async* {
    yield failureOrNewsFeed.fold(
      (failure) => ResultError(message: _mapFailureToMessage(failure)),
      (details) => ResultLoaded(resultData: details),
    );
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
