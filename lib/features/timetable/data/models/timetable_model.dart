import 'package:Attendit/features/timetable/domain/entities/timetable.dart';
import 'package:meta/meta.dart';

class TimingModel extends Timing {
  TimingModel(
      {@required final String time,
      @required final String subjectName,
      @required final String facultyName})
      : super(time, subjectName, facultyName);

  factory TimingModel.fromJson(Map<String, dynamic> json) {
    return TimingModel(
        time: json['time'],
        subjectName: json['subjectName'],
        facultyName: json['facultyName']);
  }

  Map<String, dynamic> toJson() {
    return {
      "time": time,
      "subjectName": subjectName,
      "facultyName": facultyName
    };
  }
}

class TimeTableModel extends TimeTable {
  TimeTableModel(
      {final List<TimingModel> monday,
      final List<TimingModel> tuesday,
      final List<TimingModel> wednesday,
      final List<TimingModel> thursday,
      final List<TimingModel> friday,
      final List<TimingModel> saturday})
      : super(
            monday: monday,
            tuesday: tuesday,
            wednesday: wednesday,
            thursday: thursday,
            friday: friday,
            saturday: saturday);

  factory TimeTableModel.fromJson(Map<String, dynamic> json) {
    return TimeTableModel(
        monday: json['monday']
            .map<TimingModel>((e) => TimingModel.fromJson(e))
            .toList(),
        tuesday: json['tuesday']
            .map<TimingModel>((e) => TimingModel.fromJson(e))
            .toList(),
        wednesday: json['wednesday']
            .map<TimingModel>((e) => TimingModel.fromJson(e))
            .toList(),
        thursday: json['thursday']
            .map<TimingModel>((e) => TimingModel.fromJson(e))
            .toList(),
        friday: json['friday']
            .map<TimingModel>((e) => TimingModel.fromJson(e))
            .toList(),
        saturday: json['saturday']
            .map<TimingModel>((e) => TimingModel.fromJson(e))
            .toList());
  }

  Map<String, List<TimingModel>> toJson() {
    return {
      "monday": monday,
      "tuesday": tuesday,
      "wednesday": wednesday,
      "thursday": thursday,
      "friday": friday,
      "saturday": saturday,
    };
  }
}
