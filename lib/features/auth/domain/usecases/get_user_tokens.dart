import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/auth/domain/entities/user_tokens.dart';
import 'package:Attendit/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserTokens implements UseCase<UserTokens, NoParams> {
  final IAuthRepository repository;

  GetUserTokens(this.repository);

  @override
  Future<Either<Failure, UserTokens>> call(NoParams params) async {
    return await repository.getTokens();
  }
}
