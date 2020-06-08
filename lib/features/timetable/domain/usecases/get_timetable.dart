import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/features/timetable/domain/entities/timetable.dart';
import 'package:dartz/dartz.dart';
import '../repositories/i_timetable_repository.dart';

class GetTimeTable {
  final ITimeTableRepository repository;

  GetTimeTable(this.repository);

  Future<Either<Failure, List<TimeTable>>> call() async {
    return await repository.getTimeTable();
  }
}
