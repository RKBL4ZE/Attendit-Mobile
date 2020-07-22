import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/result/data/datasources/result_remote_datasource.dart';

import 'package:Attendit/features/result/domain/entities/rank.dart';

import 'package:Attendit/features/result/domain/entities/result.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/i_result_repository.dart';

@Injectable(as: IResultRepository)
@lazySingleton
class ResultRepository implements IResultRepository {
  final INetworkInfo _networkInfo;
  final IResultRemoteDataSource _remoteDataSource;

  ResultRepository(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, ResultData>> getResult(String enrollment) async {
    if (await _networkInfo.isConnected) {
      try {
        final result =
            await _remoteDataSource.getResult(enrollment: enrollment);
        return Right(result);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Rank>>> getRankList(
      {String rankType,
      String takenFrom,
      String batch,
      String institutionCode,
      num limit,
      num offset}) async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _remoteDataSource.getRankList(
            rankType: rankType,
            takenFrom: takenFrom,
            batch: batch,
            institutionCode: institutionCode,
            limit: limit,
            offset: offset);
        return Right(result);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
