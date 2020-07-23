import 'package:dartz/dartz.dart';

import 'package:Attendit/core/error/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../repositories/i_home_repository.dart';

@lazySingleton
class GetEnrollment implements UseCase<String, NoParams> {
  final IHomeRepository repository;

  GetEnrollment(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.getEnrollment();
  }
}
