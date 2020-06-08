import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/home/domain/entities/student_assignment.dart';
import 'package:dartz/dartz.dart';

import '../repositories/i_home_repository.dart';

class GetStudentAssignment {
  final IHomeRepository repository;

  GetStudentAssignment(this.repository);

  Future<Either<Failure, List<StudentAssignment>>> call() async {
    return await repository.getStudentAssignment();
  }
}
