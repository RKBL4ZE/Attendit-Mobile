import 'package:Attendit/features/timetable/domain/entities/timetable.dart';
import 'package:meta/meta.dart';

class SubjectNameModel extends SubjectName {
  SubjectNameModel(
      {@required final String name, @required final String fullName})
      : super(name, fullName);

  factory SubjectNameModel.fromJson(Map<String, dynamic> json) {
    return SubjectNameModel(
      name: json['name'],
      fullName: json['fullName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "fullName": fullName,
    };
  }
}

class FacultyModel extends Faculty {
  FacultyModel({@required final String name}) : super(name);

  factory FacultyModel.fromJson(Map<String, dynamic> json) {
    return FacultyModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
    };
  }
}

class TimingModel extends Timing {
  TimingModel({
    @required final String startTime,
    @required final String endTime,
    @required final SubjectNameModel subject,
    @required final FacultyModel faculty,
  }) : super(startTime, endTime, subject, faculty);

  factory TimingModel.fromJson(Map<String, dynamic> json) {
    return TimingModel(
        startTime: json['startTime'],
        endTime: json['endTime'],
        subject: SubjectNameModel.fromJson(json['subject']),
        faculty: FacultyModel.fromJson(json['faculty']));
  }

  Map<String, dynamic> toJson() {
    return {
      "startTime": startTime,
      "endTime": endTime,
      "subject": subject,
      "faculty": faculty,
    };
  }
}

class TimeTableModel extends TimeTable {
  TimeTableModel({
    final List<TimingModel> monday,
    final List<TimingModel> tuesday,
    final List<TimingModel> wednesday,
    final List<TimingModel> thursday,
    final List<TimingModel> friday,
    final List<TimingModel> saturday,
    final List<TimingModel> sunday,
  }) : super(
            monday: monday,
            tuesday: tuesday,
            wednesday: wednesday,
            thursday: thursday,
            friday: friday,
            saturday: saturday,
            sunday: sunday);

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
          .toList(),
      sunday: json['sunday']
          .map<TimingModel>((e) => TimingModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, List<TimingModel>> toJson() {
    return {
      "monday": monday,
      "tuesday": tuesday,
      "wednesday": wednesday,
      "thursday": thursday,
      "friday": friday,
      "saturday": saturday,
      "sunday": sunday,
    };
  }
}

class GroupModel extends Group {
  GroupModel({@required final num id, @required final TimeTableModel timetable})
      : super(id, timetable);

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
        id: json['id'], timetable: TimeTableModel.fromJson(json['timetable']));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "timetable": timetable,
    };
  }
}
