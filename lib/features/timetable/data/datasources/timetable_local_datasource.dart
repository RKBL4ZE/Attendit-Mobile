import 'dart:convert';

import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class ITimeTableLocalDataSource {
  Future<List<GroupModel>> getTimeTable();

  Future<void> cacheTimeTable(List<GroupModel> groupModel);
}

const String CACHE_TIMETABLE = "CACHE_TIMETABLE";

@Injectable(as: ITimeTableLocalDataSource)
@lazySingleton
class TimeTableLocalDataSource implements ITimeTableLocalDataSource {
  final Box _box;

  TimeTableLocalDataSource(this._box);

  @override
  Future<void> cacheTimeTable(List<GroupModel> timetable) {
    return _box.put(CACHE_TIMETABLE,
        json.encode(timetable.map((e) => e.toJson()).toList().toString()));
  }

  @override
  Future<List<GroupModel>> getTimeTable() {
    final studentTimeTableString = _box.get(CACHE_TIMETABLE);
    if (studentTimeTableString != null) {
      final groupModel = json
          .decode(studentTimeTableString)
          .map<GroupModel>((e) => GroupModel.fromJson(e))
          .toList();

      return Future.value(groupModel);
    }
    throw CacheException();
  }
}
