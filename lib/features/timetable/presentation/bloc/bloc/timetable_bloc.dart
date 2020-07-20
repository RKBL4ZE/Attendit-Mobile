import 'dart:async';

import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';

import 'package:Attendit/features/timetable/domain/entities/timetable.dart';
import 'package:Attendit/features/timetable/domain/usecases/get_timetable.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'timetable_event.dart';
part 'timetable_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNAUTHORIZED_FAILURE_MESSAGE = 'Invalid Crendentials';

@injectable
class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  final GetTimeTable getTimeTable;

  TimetableBloc(this.getTimeTable);
  @override
  TimetableState get initialState => TimetableLoading();

  @override
  Stream<TimetableState> mapEventToState(
    TimetableEvent event,
  ) async* {
    if (event is GetTimeTableEvent) {
      yield TimetableLoading();
      final failureOrTimeTable = await getTimeTable(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrTimeTable);
    }
  }

  Stream<TimetableState> _eitherLoadedOrErrorState(
    Either<Failure, List<Group>> failureOrTimeTable,
  ) async* {
    yield failureOrTimeTable.fold(
      (failure) => TimetableError(message: _mapFailureToMessage(failure)),
      (timetable) {
        return TimetableLoaded(timetable);
      },
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
