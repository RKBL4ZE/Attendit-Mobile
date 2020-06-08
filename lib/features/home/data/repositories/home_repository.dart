import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/student_attendance.dart';
import '../../domain/entities/student_details.dart';
import '../../domain/repositories/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  @override
  Future<Either<Failure, List<StudentAttendance>>> getStudentAttendance() {
    // TODO: implement getStudentAttendance
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, StudentDetails>> getStudentDetails() {
    // TODO: implement getStudentDetails
    throw UnimplementedError();
  }

}