import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/student_attendance.dart';
import '../entities/student_details.dart';

abstract class IHomeRepository {
  Future<Either<Failure, StudentDetails>> getStudentDetails();

  Future<Either<Failure, List<StudentAttendance>>> getStudentAttendance();
}
