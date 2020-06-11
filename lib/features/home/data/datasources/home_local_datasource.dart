import 'dart:convert';

import 'package:hive/hive.dart';

import '../../../../core/error/exceptions.dart';
import '../models/student_assigments_model.dart';
import '../models/student_attendence_model.dart';
import '../models/student_details_model.dart';

abstract class IHomeLocalDataSource {
  /// Gets the cached [StudentDetailsModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  ///
  Future<StudentDetailsModel> getStudentDetails();

  /// Gets the cached [StudentAttendanceModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  ///
  Future<List<StudentAttendanceModel>> getStudentAttendance();

  /// Gets the cached [StudentAssignmentModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  ///
  Future<List<StudentAssignmentModel>> getStudentAssignments();

  Future<void> cacheStudentDetails(StudentDetailsModel studentDetails);
  Future<void> cacheStudentAssignments(
      StudentAssignmentModel studentAssignment);
  Future<void> cacheStudentAttendance(StudentAttendanceModel studentAttendance);
}

const String CACHE_STUDENT_DETAILS = "CACHE_STUDENT_DETAILS";
const String CACHE_STUDENT_ATTENDANCE = "CACHE_STUDENT_ATTENDANCE";
const String CACHE_STUDENT_ASSIGNMENTS = "CACHE_STUDENT_ASSIGNMENTS";

class HomeLocalDataSource implements IHomeLocalDataSource {
  final Box _box;

  HomeLocalDataSource(this._box);
  @override
  Future<void> cacheStudentAssignments(
      StudentAssignmentModel studentAssignment) {
    return _box.put(
        CACHE_STUDENT_ASSIGNMENTS, json.encode(studentAssignment.toJson()));
  }

  @override
  Future<void> cacheStudentAttendance(
      StudentAttendanceModel studentAttendance) {
    return _box.put(
        CACHE_STUDENT_ATTENDANCE, json.encode(studentAttendance.toJson()));
  }

  @override
  Future<void> cacheStudentDetails(StudentDetailsModel studentDetails) {
    return _box.put(
        CACHE_STUDENT_DETAILS, json.encode(studentDetails.toJson()));
  }

  @override
  Future<List<StudentAssignmentModel>> getStudentAssignments() {
    final studentAssignmentString = _box.get(CACHE_STUDENT_ASSIGNMENTS);
    if (studentAssignmentString != null) {
      final studentAssignemtModel =
          StudentAssignmentModel.fromJson(json.decode(studentAssignmentString));

      return Future.value(studentAssignemtModel);
    }
    throw CacheException();
  }

  @override
  Future<List<StudentAttendanceModel>> getStudentAttendance() {
    final studentAttendanceString = _box.get(CACHE_STUDENT_ATTENDANCE);
    if (studentAttendanceString != null) {
      final studentAttendanceModel =
          StudentAttendanceModel.fromJson(json.decode(studentAttendanceString));

      return Future.value(studentAttendanceModel);
    }
    throw CacheException();
  }

  @override
  Future<StudentDetailsModel> getStudentDetails() {
    final studentDetailsString = _box.get(CACHE_STUDENT_DETAILS);
    if (studentDetailsString != null) {
      final studentDetailsModel =
          StudentDetailsModel.fromJson(json.decode(studentDetailsString));

      return Future.value(studentDetailsModel);
    }
    throw CacheException();
  }
}
