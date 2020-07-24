part of 'rank_bloc.dart';

abstract class RankState extends Equatable {}

class RankInitial extends RankState {
  @override
  List<Object> get props => [];
}

class RankListLoading extends RankState {
  @override
  List<Object> get props => [];
}

class RankListLoaded extends RankState {
  final List<Rank> rankList;
  final List<Rank> uRankList;
  final bool hasReachedMax;

  RankListLoaded(this.rankList, this.uRankList, this.hasReachedMax);

  RankListLoaded copyWith(
      List<Rank> rankList, List<Rank> uRankList, bool hasReachedMax) {
    return RankListLoaded(rankList ?? this.rankList,
        uRankList ?? this.uRankList, hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [rankList, uRankList, hasReachedMax];
}

class RankListError extends RankState {
  final String message;

  RankListError({this.message});

  @override
  List<Object> get props => [message];
}
