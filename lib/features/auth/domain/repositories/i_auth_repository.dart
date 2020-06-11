import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/auth/domain/entities/user_tokens.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  UserTokens userTokens;

  Future<Either<Failure, bool>> signin(
      {String prefix, String userType, String username, String password});

  Future<Either<Failure, bool>> refresh(String refreshtoken);

  Future<Either<Failure, UserTokens>> getTokens();
}
