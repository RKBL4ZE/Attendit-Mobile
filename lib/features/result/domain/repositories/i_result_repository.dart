import 'package:Attendit/features/result/domain/entities/result.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class IResultRepository {
  Future<Either<Failure, List<Result>>> getResult();
}
