import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/network/network_info.dart';
import 'package:Attendit/features/timetable/data/datasources/timetable_local_datasource.dart';
import 'package:Attendit/features/timetable/data/datasources/timetable_remote_datasource.dart';
import 'package:Attendit/features/timetable/domain/entities/timetable.dart';
import 'package:Attendit/features/timetable/domain/repositories/i_timetable_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ITimeTableRepository)
@lazySingleton
class TimeTableRepository implements ITimeTableRepository {

  final ITimeTableRemoteDatasource _remoteDataSource;
  final ITimeTableLocalDataSource _localDataSource;
  final INetworkInfo _networkInfo;

  TimeTableRepository(this._remoteDataSource,this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<Group>>> getTimeTable() async {
    if (await _networkInfo.isConnected) {
      try {
        final models = await _remoteDataSource.getTimeTable();
         await _localDataSource.cacheTimeTable(models);
        return Right(models);
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      }
    } else {
      try{
        final models = await _localDataSource.getTimeTable();
        return Right(models);
      } on CacheException{
        return Left(CacheFailure());
      }
    }
  }

}