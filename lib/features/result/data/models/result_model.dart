import 'package:Attendit/features/result/domain/entities/result.dart';
import 'package:meta/meta.dart';

class InternalsModel extends Internals {
  InternalsModel(
      {@required final String subjectCode,
      @required final String subjectName,
      @required final num semesterId,
      @required final num marks,
      @required final num maxMarks})
      : super(subjectCode, subjectName, semesterId, marks, maxMarks);

  factory InternalsModel.fromJson(Map<String, dynamic> json) {
    return InternalsModel(
        subjectName: json['subjectName'],
        marks: json['marks'],
        maxMarks: json['maxMarks'],
        semesterId: json['semesterId'],
        subjectCode: json['subjectCode']);
  }

  Map<String, dynamic> toJson() {
    return {
      "subjectName": subjectName,
      "marks": marks,
      "maxMarks": maxMarks,
      "semesterId": semesterId,
      "subjectCode": subjectCode,
    };
  }
}

class ExternalsModel extends Externals {
  ExternalsModel(
      {@required final String subjectCode,
      @required final String subjectName,
      @required final num semesterId,
      @required final num internalsMarks,
      @required final num externalMarks,
      @required final num maxInternalsMarks,
      @required final String grade})
      : super(subjectCode, subjectName, semesterId, internalsMarks,
            externalMarks, maxInternalsMarks, grade);

  factory ExternalsModel.fromJson(Map<String, dynamic> json) {
    return ExternalsModel(
        subjectCode: json['subjectCode'],
        subjectName: json['subjectName'],
        semesterId: json['semesterId'],
        internalsMarks: json['internalsMarks'],
        externalMarks: json['externalMarks'],
        maxInternalsMarks: json['maxInternalsMarks'],
        grade: json['grade']);
  }

  Map<String, dynamic> toJson() {
    return {
      "subjectCode": subjectCode,
      "subjectName": subjectName,
      "semesterId": semesterId,
      "internalsMarks": internalsMarks,
      "externalMarks": externalMarks,
      "maxInternalsMarks": maxInternalsMarks,
      "grade": grade,
    };
  }
}

class GradeModel extends Grade {
  GradeModel(
      {@required final String name,
      @required final num percentage,
      @required final num semesterId})
      : super(name, percentage, semesterId);

  factory GradeModel.fromJson(Map<String, dynamic> json) {
    return GradeModel(
        name: json['name'],
        percentage: json['percentage'],
        semesterId: json['semesterId']);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "percentage": percentage,
      "semesterId": semesterId,
    };
  }
}

class CreditsModel extends Credits {
  CreditsModel({@required final num semsterId, @required final num credits})
      : super(semsterId, credits);

  factory CreditsModel.fromJson(Map<String, dynamic> json) {
    return CreditsModel(
      semsterId: json['semsterId'],
      credits: json['credits'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "semsterId": semsterId,
      "credits": credits,
    };
  }
}

class ResultModel extends Result {
  ResultModel({
    @required final String enrollment,
    @required final String name,
    @required final List<Internals> internals,
    @required final List<Externals> externals,
    @required final List<Grade> grade,
    @required final List<Credits> credits,
  }) : super(
            enrollment: enrollment,
            name: name,
            internals: internals,
            externals: externals,
            grade: grade,
            credits: credits);


factory ResultModel.fromJson(Map<String, dynamic> json){
  return ResultModel(
    enrollment: json['enrollment'],
    name: json['name'],
    internals: json['internals']
            .map<ResultModel>((e) => ResultModel.fromJson(e))
            .toList(),
    externals: json['externals']
            .map<ResultModel>((e) => ResultModel.fromJson(e))
            .toList(),
    grade: json['grade']
            .map<ResultModel>((e) => ResultModel.fromJson(e))
            .toList(), 
    credits: json['credits']
            .map<ResultModel>((e) => ResultModel.fromJson(e))
            .toList(),                          
  );
}

Map<String,dynamic> toJson() {
    return {
      "enrollment": enrollment,
      "name": name,
      "internals":internals,
      "externals":externals,
      "grade":grade,
      "credits":credits,
      
    };
  }

}
