import 'dart:async';

import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/home/data/models/student_details_model.dart';
import 'package:Attendit/features/home/domain/usecases/get_all_details.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNAUTHORIZED_FAILURE_MESSAGE = 'Invalid Crendentials';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetAllDetails getAllDetails;

  ProfileBloc(this.getAllDetails) {
    this.add(GetProfileEvent());
  }
  @override
  ProfileState get initialState => ProfileLoading();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetProfileEvent) {
      yield ProfileLoading();
      final failureOrAllDetails = await getAllDetails(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrAllDetails);
    }
  }

  Stream<ProfileState> _eitherLoadedOrErrorState(
    Either<Failure, Map<String, dynamic>> failureOrAllDetails,
  ) async* {
    yield failureOrAllDetails.fold(
      (failure) => ProfileError(message: _mapFailureToMessage(failure)),
      (details) => ProfileLoaded(details),
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
