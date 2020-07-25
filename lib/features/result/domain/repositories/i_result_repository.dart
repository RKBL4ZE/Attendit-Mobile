import 'package:Attendit/features/result/domain/entities/rank.dart';
import 'package:Attendit/features/result/domain/entities/result.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class IResultRepository {
  Future<Either<Failure, ResultData>> getResult(String enrollment);

  Future<Either<Failure, List<Rank>>> getRankList(
      {String rankType,
      String takenFrom,
      String batch,
      String institutionCode,
      num limit,
      String rollNumber,
      num offset});
}
