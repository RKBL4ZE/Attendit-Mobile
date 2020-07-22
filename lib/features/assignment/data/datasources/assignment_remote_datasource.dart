import 'dart:io';

import 'package:Attendit/core/network/graphql_service.dart';
import 'package:Attendit/core/util/gql_mutation.dart';
import 'package:Attendit/features/assignment/data/models/student_assigments_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';

import '../../../../core/util/gql_query.dart';

abstract class IAssignmentRemoteDataSource {
  Future<Map<String, dynamic>> getAssignmentDetails();
  Future submitAssignment({String id, File file});
}

@Injectable(as: IAssignmentRemoteDataSource)
@lazySingleton
class AssignmentRemoteDataSource implements IAssignmentRemoteDataSource {
  final IGraphQLService _client;

  AssignmentRemoteDataSource(this._client);

  @override
  Future<Map<String, dynamic>> getAssignmentDetails() async {
    try {
      final result = await _client.query(
          query: Gqlquery.studentAssignmentQuery,
          fetchPolicy: FetchPolicy.networkOnly); //todo: future change query
      if (result.exception == null) {
        var assignmentDetails = Map<String, dynamic>();

        assignmentDetails.putIfAbsent(
            'StudentAssignments',
            () => result.data["StudentAssignments"]
                .map<StudentAssignmentModel>(
                    (e) => StudentAssignmentModel.fromJson(e))
                .toList());

        return assignmentDetails;
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
  Future submitAssignment({String id, File file}) async {
    try {
      final result = await _client
          .mutate(mutation: Gqlmutation.submitAssignmentMutation, variables: {
        "id": id,
        "file": file,
      });
      if (result.exception == null) {
        return result.data["SubmitAssignment"];
      }
      // if (result.exception == null) {
      //   print(result.data);
      //   return UserTokensModel.fromJson(result.data['login']);
      // }
      print(result.exception);
      throw UnauthorizedException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } on Exception catch (exception) {
      print(exception);
      throw ServerException();
    }
  }
}
