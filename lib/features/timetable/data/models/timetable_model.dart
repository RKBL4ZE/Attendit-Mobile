import 'package:Attendit/features/timetable/domain/entities/timetable.dart';
import 'package:meta/meta.dart';

class SubjectModel extends Subject {
  SubjectModel(
      {@required final String subjectCode, @required final String subjectName})
      : super(subjectCode, subjectName);

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subjectName: json['subjectName'],
      subjectCode: json['subjectCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subjectCode": subjectCode,
      "subjectName": subjectName,
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
  TimingModel(
      {@required final String startTime,
      @required final String endTime,
      @required final List<FacultyModel> faculty,
      @required final List<SubjectModel> subject})
      : super(startTime, endTime, subject, faculty);

  factory TimingModel.fromJson(Map<String, dynamic> json) {
    return TimingModel(
        startTime: json['startTime'],
        endTime: json['endTime'],
        subject: json['subject']
            .map<SubjectModel>((e) => SubjectModel.fromJson(e))
            .toList(),
        faculty: json['faculty']
            .map<FacultyModel>((e) => FacultyModel.fromJson(e))
            .toList());
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
