import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/result/domain/entities/rank.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../repositories/i_result_repository.dart';

@lazySingleton
class GetRankList implements UseCase<List<Rank>, Params> {
  final IResultRepository repository;

  GetRankList(this.repository);
  @override
  Future<Either<Failure, List<Rank>>> call(Params params) async {
    return await repository.getRankList(
        rankType: params.rankType,
        takenFrom: params.takenFrom,
        batch: params.batch,
        institutionCode: params.institutionCode,
        limit: params.limit,
        offset: params.offset
		);
  }
}

class Params {
  final String rankType;
  final String takenFrom;
  final String batch;
  final String institutionCode;
  final num limit;
  final num offset;

  Params(
      {@required this.rankType,
      @required this.takenFrom,
      @required this.batch,
      @required this.institutionCode,
      this.limit,
      this.offset});
}
