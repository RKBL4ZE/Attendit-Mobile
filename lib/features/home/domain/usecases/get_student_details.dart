import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/home/domain/entities/student_details.dart';
import 'package:dartz/dartz.dart';

import '../repositories/i_home_repository.dart';

class GetStudentDetails {
  final IHomeRepository repository;

  GetStudentDetails(this.repository);

  Future<Either<Failure, StudentDetails>> call() async {
    return await repository.getStudentDetails();
  }
}

//

// {
//
//   "subjectName": "Maths",
//   "subjectCode": "BCA 202",
//   "lecturesAttended": 15,
//   "totalLectures": 20

// },
// {

//   "subjectName": "Technical Commuincation",
//   "subjectCode": "BCA 302",
//   "lecturesAttended": 19,
//   "totalLectures": 20

// }