import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/home/domain/entities/student_details.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../repositories/i_home_repository.dart';

@lazySingleton
class GetStudentDetails implements UseCase<StudentDetails, NoParams> {
  final IHomeRepository repository;

  GetStudentDetails(this.repository);

  Future<Either<Failure, StudentDetails>> call(NoParams params) async {
    return await repository.getStudentDetails();
  }
}


