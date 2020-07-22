import 'package:Attendit/core/network/graphql_service.dart';
import 'package:Attendit/features/home/data/models/student_assigments_model.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';

import '../../../../core/util/gql_query.dart';

import '../models/student_attendence_model.dart';

import '../models/student_details_model.dart';

abstract class IHomeRemoteDataSource {
  /// Gets the cached [StudentDetailsModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [ServerException] if no cached data is present.
  ///
  Future<StudentDetailsModel> getStudentDetails();

  /// Gets the cached [StudentAttendanceModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [ServerException] if no cached data is present.
  ///
  Future<List<StudentAttendanceModel>> getStudentAttendance();

  /// Gets the cached [StudentAssignmentModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [ServerException] if no cached data is present.
  ///
  Future<List<StudentAssignmentModel>> getStudentAssignments();

  /// Gets the cached [StudentDetailsModel, StudentAttendanceModel, StudentAssignmentModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [ServerException] if no cached data is present.
  ///
  Future<Map<String, dynamic>> getAllDetails();
}

@Injectable(as: IHomeRemoteDataSource)
@lazySingleton
class HomeRemoteDataSource implements IHomeRemoteDataSource {
  final IGraphQLService _client;

  HomeRemoteDataSource(this._client);

  @override
  Future<List<StudentAssignmentModel>> getStudentAssignments() {
    throw UnimplementedError();
  }

  @override
  Future<List<StudentAttendanceModel>> getStudentAttendance() {
    throw UnimplementedError();
  }

  @override
  Future<StudentDetailsModel> getStudentDetails() async {
    try {
      final result = await _client.query(
          query: Gqlquery.studentDetailsQuery); //todo: future change query
      if (result.exception == null) {
        return StudentDetailsModel.fromJson(result.data["Student"]);
      }
      throw UnauthorizedException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } on Exception catch (exception) {
      print(exception);
      throw ServerException();
    }
  }

  @override
  Future<Map<String, dynamic>> getAllDetails() async {
    try {
      final result = await _client.query(
        query: Gqlquery.studentAllDetailsQuery,
      ); //todo: future change query
      if (result.exception == null) {
        var allDetails = Map<String, dynamic>();
        allDetails.putIfAbsent('Student',
            () => StudentDetailsModel.fromJson(result.data["Student"]));
        allDetails.putIfAbsent(
            'StudentAssignments',
            () => result.data["StudentAssignments"]
                .map<StudentAssignmentModel>(
                    (e) => StudentAssignmentModel.fromJson(e))
                .toList());
        allDetails.putIfAbsent(
            'StudentAttendance',
            () => result.data["StudentAttendance"]
                .map<StudentAttendanceModel>(
                    (e) => StudentAttendanceModel.fromJson(e))
                .toList());
        return allDetails;
      }
      throw UnauthorizedException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } on Exception catch (exception) {
      print(exception);
      throw ServerException();
    }
  }
}
