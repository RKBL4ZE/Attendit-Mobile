import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/home/domain/entities/student_attendance.dart';
import 'package:dartz/dartz.dart';

import '../repositories/i_home_repository.dart';

class GetStudentAttendance {
  final IHomeRepository repository;

  GetStudentAttendance(this.repository);

  Future<Either<Failure, List<StudentAttendance>>> call() async {
    return await repository.getStudentAttendance();
  }
}
