import 'package:Attendit/features/home/domain/entities/student_assignment.dart';
import 'package:Attendit/features/home/domain/repositories/i_home_repository.dart';
import 'package:Attendit/features/home/domain/usecases/get_student_assignment.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements IHomeRepository {}

void main() {
  GetStudentAssignment usecase;
  MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetStudentAssignment(mockHomeRepository);
  });

  final tStudentAssignment = List<StudentAssignment>();
  tStudentAssignment.add(StudentAssignment(
      id: "qwe",
      facultyId: "qwe1",
      facultyName: "sumender",
      semesterName: "qwe2",
      semesterId: 123,
      subjectCode: "BCA 122",
      subjectName: "BCA12",
      title: "Bca Assignment",
      file: "http://urlfile",
      submitFile: "submit file",
      status: "completed"));
  tStudentAssignment.add(StudentAssignment(
      id: "bcaid",
      facultyId: "qwe12",
      facultyName: "sumender",
      semesterName: "qwe3",
      semesterId: 4123,
      subjectCode: "BCA 1222",
      subjectName: "BCA123",
      title: "Bca Assignmen2t",
      file: "http://urlfile1",
      submitFile: "submit file1",
      status: "incomplete"));

  test('should get student attendance from the repository', () async {
    // arrange
    when(mockHomeRepository.getStudentAssignment())
        .thenAnswer((_) async => Right(tStudentAssignment));

    // act
    final result = await usecase();

    // assert
    expect(result, Right(tStudentAssignment));
    verify(mockHomeRepository.getStudentAssignment());
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
