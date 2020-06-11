import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/home/domain/entities/student_details.dart';
import 'package:Attendit/features/home/domain/repositories/i_home_repository.dart';
import 'package:Attendit/features/home/domain/usecases/get_student_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements IHomeRepository {}

void main() {
  GetStudentDetails usecase;
  MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetStudentDetails(mockHomeRepository);
  });

  final tStudentDetails = StudentDetails(classroomId: "43453tg",
    address: "L - Extn 9B, 110059",
    courseName: "BCA",
    courseId: 1,
    email: "rkzofficial@outlook.in",
    enrollment: "00414902019",
    gender: "Male",
    mobile: "9999123658",
    name: "Raj Kishore",
    parentAltMobile: "9871589291",
    parentEmail: "kshiv0639@gmail.com",
    parentName: "Shiv Kumar",
    profilePicture: "http://localhost/raj.jpeg",
    parentMobile: "9910221228",
    section: "B",
    semesterName: "BCA Sem2",
    semesterId: 2,
    session: "2019-2022",
    shift: "Morning",
  );

  test('should get student_details from the repository', () async {
    // arrange
    when(mockHomeRepository.getStudentDetails())
        .thenAnswer((_) async => Right(tStudentDetails));

    // act
    final result = await usecase.call(NoParams());


    // assert
    expect(result, Right(tStudentDetails));
    verify(mockHomeRepository.getStudentDetails());
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
