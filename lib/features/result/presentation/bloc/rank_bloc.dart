import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/result/domain/entities/rank.dart';
import 'package:Attendit/features/result/domain/usecases/get_rank_list.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';

part 'rank_event.dart';
part 'rank_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNAUTHORIZED_FAILURE_MESSAGE = 'Invalid Crendentials';

@injectable
class RankBloc extends Bloc<RankEvent, RankState> {
  final GetRankList getRankList;

  RankBloc(this.getRankList) : super(RankInitial());

  @override
  Stream<Transition<RankEvent, RankState>> transformEvents(
    Stream<RankEvent> events,
    TransitionFunction<RankEvent, RankState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<RankState> mapEventToState(
    RankEvent event,
  ) async* {
    if (event is GetRankListEvent) {
      print('Fetching Ranks');
      final currentState = state;

      if (currentState is RankInitial) {
        yield RankListLoading();
        final failureOrSucessC = await getRankList(Params(
            rankType: 'institution',
            takenFrom: event.takenFrom,
            batch: event.batch,
            institutionCode: event.institutionCode,
            limit: 50,
            offset: 0));
        final failureOrSucessU = await getRankList(Params(
            rankType: 'university',
            takenFrom: event.takenFrom,
            batch: event.batch,
            institutionCode: event.institutionCode,
            limit: 50,
            offset: 0));
        yield* _eitherLoadedOrErrorStateInitial(
            failureOrSucessC, failureOrSucessU);
      }
      if (currentState is RankListLoaded) {
        final failureOrSucessC = await getRankList(Params(
            rankType: 'institution',
            takenFrom: event.takenFrom,
            batch: event.batch,
            institutionCode: event.institutionCode,
            limit: 50,
            offset: currentState.rankList.length));
        final failureOrSucessU = await getRankList(Params(
            rankType: 'university',
            takenFrom: event.takenFrom,
            batch: event.batch,
            institutionCode: event.institutionCode,
            limit: 50,
            offset: currentState.uRankList.length));
        yield* _eitherLoadedOrErrorState(
            failureOrSucessC, failureOrSucessU, currentState);
      }
    }
  }

  Stream<RankState> _eitherLoadedOrErrorState(
      Either<Failure, List<Rank>> failureOrSuccessC,
      Either<Failure, List<Rank>> failureOrSuccessU,
      RankListLoaded currentState) async* {
    final res = failureOrSuccessC.fold(
      (failure) => RankListError(message: _mapFailureToMessage(failure)),
      (rankC) => failureOrSuccessU.fold(
          (failure) => RankListError(message: _mapFailureToMessage(failure)),
          (rankU) => RankListLoaded(currentState.rankList + rankC,
              currentState.uRankList + rankU, false)),
    );
    yield res;
  }

  Stream<RankState> _eitherLoadedOrErrorStateInitial(
    Either<Failure, List<Rank>> failureOrSuccessC,
    Either<Failure, List<Rank>> failureOrSuccessU,
  ) async* {
    final res = failureOrSuccessC.fold(
      (failure) => RankListError(message: _mapFailureToMessage(failure)),
      (rankC) => failureOrSuccessU.fold(
          (failure) => RankListError(message: _mapFailureToMessage(failure)),
          (rankU) => RankListLoaded(rankC, rankU, false)),
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
