import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/student_assigments_model.dart';
import '../../data/models/student_attendence_model.dart';
import '../../data/models/student_details_model.dart';
import '../../domain/usecases/get_all_details.dart';
import '../../domain/usecases/get_student_details.dart';

part 'home_event.dart';
part 'home_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetStudentDetails getStudentDetails;
  final GetAllDetails getAllDetails;

  HomeBloc(this.getStudentDetails, this.getAllDetails)
      : super(DetailsLoading()) {
    this.add(GetDetailsEvent());
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetDetailsEvent) {
      yield DetailsLoading();
      final failureOrAllDetails = await getAllDetails(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrAllDetails);
    }
  }

  Stream<HomeState> _eitherLoadedOrErrorState(
    Either<Failure, Map<String, dynamic>> failureOrAllDetails,
  ) async* {
    yield failureOrAllDetails.fold(
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
      default:
        return 'Unexpected error';
    }
  }
}
