import 'dart:io';

import 'package:dartz/dartz.dart';
import '../entities/student_assignment.dart';
import '../../../../core/error/failures.dart';

abstract class IAssignmentRepository {
 Future<Either<Failure, Map<String, dynamic>>> getStudentAssignments();

  Future<Either<Failure, bool>> submitAssignment(
      { String id, File file});
}
