import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/timetable.dart';



abstract class ITimeTableRepository {
  Future<Either<Failure, List<TimeTable>>> getTimeTable();

  
}
