import 'package:Attendit/features/home/domain/repositories/i_home_repository.dart';
import 'package:Attendit/features/home/domain/usecases/get_student_attendance.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../lib/features/home/domain/entities/student_attendance.dart';

class MockHomeRepository extends Mock implements IHomeRepository {}

void main() {
  GetStudentAttendance usecase;
  MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetStudentAttendance(mockHomeRepository);
  });

  final tStudentAttendance = List<StudentAttendance>();
}
