import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/core/network/network_info.dart';
import 'package:Attendit/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:Attendit/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:Attendit/features/auth/domain/entities/user_tokens.dart';
import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final IAuthLocalDataSource _localDataSource;
  final INetworkInfo _networkInfo;
  final IAuthRemoteDataSource _remoteDataSource;

  @override
  UserTokens userTokens;

  AuthRepository(
      this._networkInfo, this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<Failure, UserTokens>> getTokens() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> refresh(String refreshtoken) async {
    if (await _networkInfo.isConnected) {
      try {
        final models = await _remoteDataSource.tryRefresh(refreshtoken);
        await _localDataSource.setLocalTokens(models);
        return Right(true);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signin(
      {String prefix,
      String userType,
      String username,
      String password}) async {
    if (await _networkInfo.isConnected) {
      try {
        final models = await _remoteDataSource.trySignin(
            prefix: prefix,
            userType: userType,
            username: username,
            password: password);
        await _localDataSource.setLocalTokens(models);
        return Right(true);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
