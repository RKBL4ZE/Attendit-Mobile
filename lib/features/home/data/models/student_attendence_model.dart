import 'package:meta/meta.dart';

import '../../domain/entities/student_attendance.dart';

class SubjectModel extends Subject {
  SubjectModel({@required String subjectCode, @required String subjectName})
      : super(subjectCode, subjectName);

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
        subjectName: json['subjectName'], subjectCode: json['subjectCode']);
  }

  Map<String, dynamic> toJson() {
    return {"subjectName": subjectName, "subjectCode": subjectCode};
  }
}

class StudentAttendanceModel extends StudentAttendance {
  StudentAttendanceModel({
    @required final SubjectModel subject,
    @required final num lecturesAttended,
    @required final num totalLectures,
  }) : super(
          subject: subject,
          lecturesAttended: lecturesAttended,
          totalLectures: totalLectures,
        );

  factory StudentAttendanceModel.fromJson(Map<String, dynamic> json) {
    return StudentAttendanceModel(
      subject: SubjectModel.fromJson(json['subject']),
      lecturesAttended: json['lecturesAttended'],
      totalLectures: json['totalLectures'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'lecturesAttended': lecturesAttended,
      'totalLectures': totalLectures,
    };
  }
}
