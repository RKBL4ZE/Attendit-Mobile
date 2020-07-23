import 'dart:async';

import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/result/domain/entities/rank.dart';
import 'package:Attendit/features/result/domain/usecases/get_rank_list.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

part 'rank_event.dart';
part 'rank_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNAUTHORIZED_FAILURE_MESSAGE = 'Invalid Crendentials';

@injectable
class RankBloc extends Bloc<RankEvent, RankState> {
  final GetRankList getRankList;

  RankBloc(this.getRankList);

  @override
  RankState get initialState => RankInitial();

  @override
  Stream<RankState> mapEventToState(
    RankEvent event,
  ) async* {
    if (event is GetRankListEvent) {
      yield RankListLoading();
      final failureOrSucessC = await getRankList(Params(
          rankType: 'institution',
          takenFrom: event.takenFrom,
          batch: event.batch,
          institutionCode: event.institutionCode,
          limit: event.limit,
          offset: event.offset));
      final failureOrSucessU = await getRankList(Params(
          rankType: 'university',
          takenFrom: event.takenFrom,
          batch: event.batch,
          institutionCode: event.institutionCode,
          limit: event.limit,
          offset: event.offset));
      yield* _eitherLoadedOrErrorState(failureOrSucessC, failureOrSucessU);
    }
  }

  Stream<RankState> _eitherLoadedOrErrorState(
    Either<Failure, List<Rank>> failureOrSuccessC,
    Either<Failure, List<Rank>> failureOrSuccessU,
  ) async* {
    final res = failureOrSuccessC.fold(
      (failure) => RankListError(message: _mapFailureToMessage(failure)),
      (rankC) => failureOrSuccessU.fold(
          (failure) => RankListError(message: _mapFailureToMessage(failure)),
          (rankU) => RankListLoaded(rankC, rankU)),
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
