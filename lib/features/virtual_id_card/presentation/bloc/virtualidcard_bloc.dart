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

part 'virtualidcard_event.dart';
part 'virtualidcard_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNAUTHORIZED_FAILURE_MESSAGE = 'Invalid Crendentials';

@injectable
class VirtualidcardBloc extends Bloc<VirtualidcardEvent, VirtualidcardState> {
  final GetAllDetails getAllDetails;

  VirtualidcardBloc(this.getAllDetails) : super(VirtualidcardLoading()) {
    this.add(GetVirtualidcardEvent());
  }

  @override
  Stream<VirtualidcardState> mapEventToState(VirtualidcardEvent event) async* {
    if (event is GetVirtualidcardEvent) {
      yield VirtualidcardLoading();
      final failureOrAllDetails = await getAllDetails(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrAllDetails);
    }
  }

  Stream<VirtualidcardState> _eitherLoadedOrErrorState(
    Either<Failure, Map<String, dynamic>> failureOrAllDetails,
  ) async* {
    yield failureOrAllDetails.fold(
      (failure) => VirtualidcardError(message: _mapFailureToMessage(failure)),
      (details) => VirtualidcardLoaded(details),
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
