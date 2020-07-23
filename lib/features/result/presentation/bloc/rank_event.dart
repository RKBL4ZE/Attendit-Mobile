part of 'rank_bloc.dart';

abstract class RankEvent {}

class GetRankListEvent extends RankEvent {
  final String rankType;
  final String takenFrom;
  final String batch;
  final String institutionCode;
  final num limit;
  final num offset;

  GetRankListEvent(
      {this.rankType,
      this.takenFrom,
      this.batch,
      this.institutionCode,
      this.limit,
      this.offset});
}

class InitialEvent extends RankEvent {}
