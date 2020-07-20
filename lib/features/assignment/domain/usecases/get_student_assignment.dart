import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/assignment/domain/repositories/i_assignment_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAssignmentDetails implements UseCase<Map<String, dynamic>, NoParams> {
  final IAssignmentRepository repository;

  GetAssignmentDetails(this.repository);
  @override
  Future<Either<Failure, Map<String, dynamic>>> call(NoParams params) async {
    return await repository.getStudentAssignments();
  }
}

