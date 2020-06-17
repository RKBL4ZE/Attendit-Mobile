import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckSession implements UseCase<bool, NoParams> {
  final IAuthRepository repository;

  CheckSession(this.repository);
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.checkSession();
  }
}
