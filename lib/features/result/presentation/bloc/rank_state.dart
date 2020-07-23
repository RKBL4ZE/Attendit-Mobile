part of 'rank_bloc.dart';

abstract class RankState {}

class RankInitial extends RankState {}

class RankListLoading extends RankState {}

class RankListLoaded extends RankState {
  final List<Rank> rankList;
  final List<Rank> uRankList;

  RankListLoaded(this.rankList, this.uRankList);
}

class RankListError extends RankState {
  final String message;

  RankListError({this.message});
}
