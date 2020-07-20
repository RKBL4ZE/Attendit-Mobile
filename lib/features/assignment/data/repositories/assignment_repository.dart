import 'dart:io';

import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/core/network/network_info.dart';
import 'package:Attendit/features/assignment/data/datasources/assignment_local_datasource.dart';
import 'package:Attendit/features/assignment/data/datasources/assignment_remote_datasource.dart';

import 'package:Attendit/features/assignment/domain/repositories/i_assignment_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';

@Injectable(as: IAssignmentRepository)
@lazySingleton
class AssignmentRepository implements IAssignmentRepository {
  final IAssignmentLocalDataSource _localDataSource;
  final INetworkInfo _networkInfo;
  final IAssignmentRemoteDataSource _remoteDataSource;

  AssignmentRepository(
      this._localDataSource, this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getStudentAssignments() async {
    if (await _networkInfo.isConnected) {
      try {
        final models = await _remoteDataSource.getAssignmentDetails();
        // await _localDataSource.cacheStudentDetails(models);
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
  Future<Either<Failure, bool>> submitAssignment({String id, File file}) async {
    if (await _networkInfo.isConnected) {
      try {
      // final result = 
       await _remoteDataSource.submitAssignment(
          id: id,
          file: file,
        );
       // if(result.)
        return Right(true);
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
