import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/home/domain/entities/student_attendance.dart';
import 'package:dartz/dartz.dart';

import '../repositories/i_home_repository.dart';

class GetStudentAttendance
    implements UseCase<List<StudentAttendance>, NoParams> {
  final IHomeRepository repository;

  GetStudentAttendance(this.repository);

  Future<Either<Failure, List<StudentAttendance>>> call(NoParams params) async {
    return await repository.getStudentAttendance();
  }
}
