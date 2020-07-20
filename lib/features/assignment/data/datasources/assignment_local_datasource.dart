import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../models/student_assigments_model.dart';

abstract class IAssignmentLocalDataSource {
  /// Gets the cached [StudentAssignmentModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  ///
  Future<List<StudentAssignmentModel>> getStudentAssignments();

  Future<void> cacheStudentAssignments(
      StudentAssignmentModel studentAssignment);
}

const String CACHE_STUDENT_ASSIGNMENTS = "CACHE_STUDENT_ASSIGNMENTS";

@Injectable(as: IAssignmentLocalDataSource)
@lazySingleton
class AssignmentLocalDataSource implements IAssignmentLocalDataSource {
  final Box _box;

  AssignmentLocalDataSource(this._box);
  @override
  Future<void> cacheStudentAssignments(
      StudentAssignmentModel studentAssignment) {
    return _box.put(
        CACHE_STUDENT_ASSIGNMENTS, json.encode(studentAssignment.toJson()));
  }

  @override
  Future<List<StudentAssignmentModel>> getStudentAssignments() {
    final studentAssignmentString = _box.get(CACHE_STUDENT_ASSIGNMENTS);
    if (studentAssignmentString != null) {
      final studentAssignemtModel = json
          .decode(studentAssignmentString)
          .map<StudentAssignmentModel>(
              (e) => {StudentAssignmentModel.fromJson(e)})
          .toList();

      return Future.value(studentAssignemtModel);
    }
    throw CacheException();
  }
}
