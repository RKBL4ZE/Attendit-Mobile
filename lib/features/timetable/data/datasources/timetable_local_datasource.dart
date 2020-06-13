import 'dart:convert';

import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class ITimeTableLocalDataSource{
  Future<TimeTableModel>getTimeTable();



  Future<void> cacheTimeTable(TimeTableModel timeTableModel);
}

const String CACHE_TIMETABLE = "CACHE_TIMETABLE";

@Injectable(as: ITimeTableLocalDataSource)
@lazySingleton
class TimeTableLocalDataSource implements ITimeTableLocalDataSource{

  final Box _box;

  TimeTableLocalDataSource(this._box);
  
  @override
  Future<void> cacheTimeTable(TimeTableModel timetable){
    return _box.put(
      CACHE_TIMETABLE, json.encode
      (timetable.toJson()));
  }

  @override
  Future<TimeTableModel> getTimeTable() {
    final studentTimeTableString = _box.get(CACHE_TIMETABLE);
    if (studentTimeTableString != null) {
      final timeTableModel = TimeTableModel.fromJson(json.decode(studentTimeTableString));

      return Future.value(timeTableModel);
    }
    throw CacheException();
  }
  
}