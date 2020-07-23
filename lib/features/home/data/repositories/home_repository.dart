import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/core/network/network_info.dart';
import 'package:Attendit/features/home/data/datasources/home_local_datasource.dart';
import 'package:Attendit/features/home/data/datasources/home_remote_datasource.dart';
import 'package:Attendit/features/home/domain/entities/student_assignment.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/student_attendance.dart';
import '../../domain/entities/student_details.dart';
import '../../domain/repositories/i_home_repository.dart';

@Injectable(as: IHomeRepository)
@lazySingleton
class HomeRepository implements IHomeRepository {
  final IHomeLocalDataSource _localDataSource;
  final INetworkInfo _networkInfo;
  final IHomeRemoteDataSource _remoteDataSource;

  HomeRepository(
      this._localDataSource, this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, List<StudentAttendance>>>
      getStudentAttendance() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, StudentDetails>> getStudentDetails() async {
    if (await _networkInfo.isConnected) {
      try {
        final models = await _remoteDataSource.getStudentDetails();
        await _localDataSource.cacheStudentDetails(models);
        return Right(models);
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<StudentAssignment>>> getStudentAssignments() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllDetails() async {
    if (await _networkInfo.isConnected) {
      try {
        final models = await _remoteDataSource.getAllDetails();
        await _localDataSource.cacheAllDetails(models);
        final StudentDetails student = models['Student'];
        await _localDataSource.cacheEnrollment(student.enrollment);
        return Right(models);
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getEnrollment() async {
    return Right(await _localDataSource.getEnrollment());
  }
}
