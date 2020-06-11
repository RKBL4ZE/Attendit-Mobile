import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/home/domain/entities/student_attendance.dart';
import 'package:Attendit/features/home/domain/repositories/i_home_repository.dart';
import 'package:Attendit/features/home/domain/usecases/get_student_attendance.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements IHomeRepository {}

void main() {
  GetStudentAttendance usecase;
  MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetStudentAttendance(mockHomeRepository);
  });

  final tStudentAttendance = List<StudentAttendance>();
  tStudentAttendance.add(StudentAttendance(
      subjectCode: "BCA 202",
      subjectName: "Maths",
      lecturesAttended: 15,
      totalLectures: 20));
  tStudentAttendance.add(StudentAttendance(
      subjectCode: "BCA 302",
      subjectName: "Technical Comms.",
      lecturesAttended: 19,
      totalLectures: 20));

  test('should get student attendance from the repository', () async {
    // arrange
    when(mockHomeRepository.getStudentAttendance())
        .thenAnswer((_) async => Right(tStudentAttendance));

    // act
    final result = await usecase.call(NoParams());

    // assert
    expect(result, Right(tStudentAttendance));
    verify(mockHomeRepository.getStudentAttendance());
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
