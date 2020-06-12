import 'dart:async';

import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/home/domain/entities/student_details.dart';
import 'package:Attendit/features/home/domain/usecases/get_student_details.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNAUTHORIZED_FAILURE_MESSAGE = 'Invalid Crendentials';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetStudentDetails getStudentDetails;

  HomeBloc(this.getStudentDetails);
  @override
  HomeState get initialState => DetailsLoading();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetDetailsEvent) {
      yield DetailsLoading();
      final failureOrStudentDetails = await getStudentDetails(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrStudentDetails);
    }
  }

  Stream<HomeState> _eitherLoadedOrErrorState(
    Either<Failure, StudentDetails> failureOrStudentDetails,
  ) async* {
    yield failureOrStudentDetails.fold(
      (failure) => DetailsError(message: _mapFailureToMessage(failure)),
      (details) => DetailsLoaded(details),
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
