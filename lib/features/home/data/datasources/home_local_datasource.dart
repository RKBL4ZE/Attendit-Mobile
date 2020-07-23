import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

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

  Future<String> getEnrollment();

  Future<void> cacheStudentDetails(StudentDetailsModel studentDetails);

  Future<void> cacheAllDetails(Map<String, dynamic> details);

  Future<void> cacheEnrollment(String enrollment);

  Future<void> cacheStudentAssignments(
      StudentAssignmentModel studentAssignment);

  Future<void> cacheStudentAttendance(StudentAttendanceModel studentAttendance);
}

const String CACHE_STUDENT_DETAILS = "CACHE_STUDENT_DETAILS";
const String CACHE_ALL_DETAILS = "CACHE_ALL_DETAILS";
const String CACHE_STUDENT_ATTENDANCE = "CACHE_STUDENT_ATTENDANCE";
const String CACHE_STUDENT_ASSIGNMENTS = "CACHE_STUDENT_ASSIGNMENTS";
const String CACHE_ENROLLMENT = "CACHE_ENROLLMENT";

@Injectable(as: IHomeLocalDataSource)
@lazySingleton
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
  Future<void> cacheAllDetails(Map<String, dynamic> details) {
    return _box.put(CACHE_ALL_DETAILS, json.encode(details));
  }

  @override
  Future<void> cacheEnrollment(String enrollment) {
    return _box.put(CACHE_ENROLLMENT, enrollment);
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

  @override
  Future<List<StudentAttendanceModel>> getStudentAttendance() {
    final studentAttendanceString = _box.get(CACHE_STUDENT_ATTENDANCE);
    if (studentAttendanceString != null) {
      final studentAttendanceModel = json
          .decode(studentAttendanceString)
          .map<StudentAttendanceModel>(
              (e) => {StudentAttendanceModel.fromJson(e)})
          .toList();

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

  @override
  Future<String> getEnrollment() {
    return Future.value(_box.get(CACHE_ENROLLMENT));
  }
}
