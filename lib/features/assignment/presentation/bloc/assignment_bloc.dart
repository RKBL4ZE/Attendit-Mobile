import 'dart:async';
import 'dart:io';

import 'package:Attendit/features/assignment/domain/usecases/get_student_assignment.dart';
import 'package:Attendit/features/assignment/domain/usecases/submit_assignment.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/student_assigments_model.dart';

part 'assignment_event.dart';
part 'assignment_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNAUTHORIZED_FAILURE_MESSAGE = 'Invalid Crendentials';

@injectable
class AssignmentBloc extends Bloc<AssignmentEvent, AssignmentState> {
  final SubmitAssignment submitAssignment;
  final GetAssignmentDetails getAssignmentDetails;

  AssignmentBloc(this.getAssignmentDetails, this.submitAssignment) {
	  this.add(GetAssignmentDetailsEvent());
  }
  @override
  AssignmentState get initialState => DetailsLoading();

  @override
  Stream<AssignmentState> mapEventToState(AssignmentEvent event) async* {
    if (event is GetAssignmentDetailsEvent) {
      yield DetailsLoading();
      final failureOrAllDetails = await getAssignmentDetails(NoParams());

      yield* _eitherLoadedOrErrorState(failureOrAllDetails);
    }
  }

  Stream<AssignmentState> _eitherLoadedOrErrorState(
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
      case UnauthorizedFailure:
        return UNAUTHORIZED_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}

@injectable
class SubmitAssignmentBloc
    extends Bloc<AssignmentEvent, SubmitAssignmentState> {
  final SubmitAssignment submitAssignment;

  SubmitAssignmentBloc(this.submitAssignment) {
	  this.add(GetAssignmentDetailsEvent());
  }
  @override
  SubmitAssignmentState get initialState => SubmitAssignmentInitial();

  @override
  Stream<SubmitAssignmentState> mapEventToState(AssignmentEvent event) async* {
    if (event is SubmitAssignmentEvent) {
      yield SubmitAssignmentUploading();
      final failureOrSucess = await submitAssignment(Params(
        id: event.id,
        file: event.file,
      ));
      yield* _eitherLoadedOrErrorState(failureOrSucess);
    }
  }

  Stream<SubmitAssignmentState> _eitherLoadedOrErrorState(
    Either<Failure, bool> failureOrSubmitAssignment,
  ) async* {
    yield failureOrSubmitAssignment.fold(
        (failure) =>
            SubmitAssignmentError(message: _mapFailureToMessage(failure)),
        (details) => SubmitAssignmentUploaded());
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
