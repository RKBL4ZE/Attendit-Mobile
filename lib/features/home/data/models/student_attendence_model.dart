import 'package:Attendit/features/shared/data/models/subject_model.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/student_attendance.dart';

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
