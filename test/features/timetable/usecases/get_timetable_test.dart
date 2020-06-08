import 'package:Attendit/features/timetable/domain/entities/timetable.dart';
import 'package:Attendit/features/timetable/domain/repositories/i_timetable_repository.dart';
import 'package:Attendit/features/timetable/domain/usecases/get_timetable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements ITimeTableRepository {}

void main() {
  GetTimeTable usecase;
  MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetTimeTable(mockHomeRepository);
  });

  final tTimeTable = List<TimeTable>();
  tTimeTable.add(TimeTable(
      monday: "monday",
      tuesday: "tuesday",
      wednesday: "wednesday",
      thursday: "thus",
      friday: "fri",
      saturday: "sat",
      sunday: "sun"));
  tTimeTable.add(TimeTable(
      monday: "Mon",
      tuesday: "Tuesday",
      wednesday: "Wednesday",
      thursday: "Thus",
      friday: "Fri",
      saturday: "Sat",
      sunday: "Sun"));

  test('should get student attendance from the repository', () async {
    // arrange
    when(mockHomeRepository.getTimeTable())
        .thenAnswer((_) async => Right(tTimeTable));

    // act
    final result = await usecase.call();

    // assert
    expect(result, Right(tTimeTable));
    verify(mockHomeRepository.getTimeTable());
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
