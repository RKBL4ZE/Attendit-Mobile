import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/timetable/domain/entities/timetable.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../repositories/i_timetable_repository.dart';

@lazySingleton
class GetTimeTable implements UseCase<TimeTable, NoParams> {
  final ITimeTableRepository repository;

  GetTimeTable(this.repository);

  Future<Either<Failure, TimeTable>> call(NoParams params) async {
    return await repository.getTimeTable();
  }
}
