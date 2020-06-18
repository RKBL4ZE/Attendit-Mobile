import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/result/domain/entities/result.dart';
import 'package:Attendit/features/result/domain/repositories/i_result_repository.dart';
import 'package:dartz/dartz.dart';



class GetResult
    implements UseCase<List<Result>, NoParams> {
  final IResultRepository repository;

  GetResult(this.repository);

  Future<Either<Failure, List<Result>>> call(NoParams params) async {
    return await repository.getResult();
  }
}
