import 'package:Attendit/features/result/domain/entities/result.dart';

//----subjects
class MinorModel extends Minor {
  MinorModel({num max, num earned}) : super(max, earned);
  factory MinorModel.fromJson(Map<String, dynamic> json) {
    return MinorModel(
      max: json['max'],
      earned: json['earned'] == '-' ? null : json['earned'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "max": max,
      "earned": earned,
    };
  }
}

class MajorModel extends Major {
  MajorModel({num max, num earned}) : super(max, earned);
  factory MajorModel.fromJson(Map<String, dynamic> json) {
    return MajorModel(
      max: json['max'],
      earned: json['earned'] == '-' ? null : json['earned'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "max": max,
      "earned": earned,
    };
  }
}

class TotalModel extends Total {
  TotalModel({num max, num earned}) : super(max, earned);
  factory TotalModel.fromJson(Map<String, dynamic> json) {
    return TotalModel(
      max: json['max'],
      earned: json['earned'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "max": max,
      "earned": earned,
    };
  }
}

class SubjectsModel extends Subjects {
  SubjectsModel(
      {String name,
      Minor minor,
      Major major,
      Total total,
      bool isPassed,
      num credits})
      : super(name, minor, major, total, isPassed, credits);
  factory SubjectsModel.fromJson(Map<String, dynamic> json) {
    return SubjectsModel(
      name: json['name'],
      minor: MinorModel.fromJson(json['minor']),
      major: MajorModel.fromJson(json['major']),
      total: TotalModel.fromJson(json['total']),
      isPassed: json['isPassed'],
      credits: json['credits'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "minor": minor,
      "major": major,
      "total": total,
      "isPassed": isPassed,
      "credits": credits,
    };
  }
}

//----results
class ExamModel extends Exam {
  ExamModel({String date, String regularReappear})
      : super(date, regularReappear);
  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      date: json['date'],
      regularReappear: json['regularReappear'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "regularReappear": regularReappear,
    };
  }
}

class SemYearModel extends SemYear {
  SemYearModel({int num, String type}) : super(num, type);
  factory SemYearModel.fromJson(Map<String, dynamic> json) {
    return SemYearModel(
      num: json['num'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "num": num,
      "type": type,
    };
  }
}

class ResultModel extends Result {
  ResultModel(
      {Exam exam,
      String prepared,
      String declared,
      SemYear semYear,
      num creditsEarned,
      List<Subjects> subjects,
      String fileId,
      num percentage,
      num maxMarks,
      num totalMarks,
      num creditPercentage,
      num collegeRank,
      num universityRank})
      : super(
            exam,
            prepared,
            declared,
            semYear,
            creditsEarned,
            subjects,
            fileId,
            percentage,
            maxMarks,
            totalMarks,
            creditPercentage,
            collegeRank,
            universityRank);

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      exam: ExamModel.fromJson(json['exam']),
      prepared: json['prepared'],
      declared: json['declared'],
      semYear: SemYearModel.fromJson(json['semYear']),
      creditsEarned: json['creditsEarned'],
      subjects: json['subjects']
          .map<SubjectsModel>((e) => SubjectsModel.fromJson(e))
          .toList(),
      fileId: json['fileId'],
      percentage: json['percentage'],
      maxMarks: json['maxMarks'],
      totalMarks: json['totalMarks'],
      creditPercentage: json['creditPercentage'],
      collegeRank: json['collegeRank'],
      universityRank: json['universityRank'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "exam": exam,
      "prepared": prepared,
      "declared": declared,
      "semYear": semYear,
      "creditsEarned": creditsEarned,
      "subjects": subjects,
      "fileId": fileId,
      "percentage": percentage,
      "maxMarks": maxMarks,
      "totalMarks": totalMarks,
      "creditPercentage": creditPercentage,
      "collegeRank": collegeRank,
      "universityRank": universityRank,
    };
  }
}

//----Result Data
class ProgrammeModel extends Programme {
  ProgrammeModel({String code, String name}) : super(code, name);
  factory ProgrammeModel.fromJson(Map<String, dynamic> json) {
    return ProgrammeModel(
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "name": name,
    };
  }
}

class InstitutionModel extends Institution {
  InstitutionModel({String code, String name}) : super(code, name);
  factory InstitutionModel.fromJson(Map<String, dynamic> json) {
    return InstitutionModel(
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "name": name,
    };
  }
}

class ResultDataModel extends ResultData {
  ResultDataModel(
      {String rollNumber,
      Programme programme,
      Institution institution,
      String name,
      String batch,
      num aggregatePercentage,
      num aggregateCreditPercentage,
      num maxCredits,
      num totalCreditsEarned,
      List<Result> results})
      : super(
            rollNumber,
            programme,
            institution,
            name,
            batch,
            aggregatePercentage,
            aggregateCreditPercentage,
            maxCredits,
            totalCreditsEarned,
            results);

  factory ResultDataModel.fromJson(Map<String, dynamic> json) {
    return ResultDataModel(
      rollNumber: json['rollNumber'],
      programme: ProgrammeModel.fromJson(json['programme']),
      institution: InstitutionModel.fromJson(json['institution']),
      name: json['name'],
      batch: json['batch'],
      aggregatePercentage: json['aggregatePercentage'],
      aggregateCreditPercentage: json['aggregateCreditPercentage'],
      maxCredits: json['maxCredits'],
      totalCreditsEarned: json['totalCreditsEarned'],
      results: json['results']
          .map<ResultModel>((e) => ResultModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "rollNumber": rollNumber,
      "programme": programme,
      "institution": institution,
      "name": name,
      "batch": batch,
      "aggregatePercentage": aggregatePercentage,
      "aggregateCreditPercentage": aggregateCreditPercentage,
      "maxCredits": maxCredits,
      "totalCreditsEarned": totalCreditsEarned,
      "results": results,
    };
  }
}
