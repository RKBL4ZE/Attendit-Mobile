import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/home/domain/entities/student_assignment.dart';
import 'package:dartz/dartz.dart';

import '../repositories/i_home_repository.dart';

class GetStudentAssignments
    implements UseCase<List<StudentAssignment>, NoParams> {
  final IHomeRepository repository;

  GetStudentAssignments(this.repository);

  Future<Either<Failure, List<StudentAssignment>>> call(NoParams params) async {
    return await repository.getStudentAssignments();
  }
}
