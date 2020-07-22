import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/result/domain/entities/result.dart';
import 'package:Attendit/features/result/domain/repositories/i_result_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
class GetResult implements UseCase<ResultData, Params> {
  final IResultRepository repository;

  GetResult(this.repository);

  @override
  Future<Either<Failure, ResultData>> call(Params params) async {
    return await repository.getResult(params.enrollment);
  }
}

class Params extends Equatable {
  final String enrollment;

  Params({
    @required this.enrollment,
  });

  @override
  List<Object> get props => [enrollment];
}
