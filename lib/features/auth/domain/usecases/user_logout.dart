import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserLogout implements UseCase<void, NoParams> {
  final IAuthRepository repository;

  UserLogout(this.repository);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return Right(await repository.logout());
  }
}
