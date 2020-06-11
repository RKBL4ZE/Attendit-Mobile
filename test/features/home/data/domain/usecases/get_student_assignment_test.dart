import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/home/domain/entities/student_assignment.dart';
import 'package:Attendit/features/home/domain/repositories/i_home_repository.dart';
import 'package:Attendit/features/home/domain/usecases/get_student_assignment.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements IHomeRepository {}

void main() {
  GetStudentAssignments usecase;
  MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetStudentAssignments(mockHomeRepository);
  });

  final tStudentAssignment = List<StudentAssignment>();
  tStudentAssignment.add(StudentAssignment(
      classroomId: "asdfasdf",
      marks: 20,
      totalMarks: 40,
      id: "qwe",
      facultyId: "qwe1",
      facultyName: "sumender",
      subjectCode: "BCA 122",
      subjectName: "BCA12",
      title: "Bca Assignment",
      file: "http://urlfile",
      submitFile: "submit file",
      status: "completed"));

  test('should get student attendance from the repository', () async {
    // arrange
    when(mockHomeRepository.getStudentAssignments())
        .thenAnswer((_) async => Right(tStudentAssignment));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result, Right(tStudentAssignment));
    verify(mockHomeRepository.getStudentAssignments());
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
