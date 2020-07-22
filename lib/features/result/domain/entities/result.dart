//----subjects

abstract class Minor {
  final num max;
  final num earned;

  Minor(this.max, this.earned);
}

abstract class Major {
  final num max;
  final num earned;

  Major(this.max, this.earned);
}

abstract class Total {
  final num max;
  final num earned;

  Total(this.max, this.earned);
}

abstract class Subjects {
  final String name;
  final Minor minor;
  final Major major;
  final Total total;
  final bool isPassed;
  final num credits;

  Subjects(this.name, this.minor, this.major, this.total, this.isPassed,
      this.credits);
}

//----results

abstract class Exam {
  final String date;
  final String regularReappear;

  Exam(this.date, this.regularReappear);
}

abstract class SemYear {
  final int num;
  final String type;

  SemYear(this.num, this.type);
}

abstract class Result {
  final Exam exam;
  final String prepared;
  final String declared;
  final SemYear semYear;
  final num creditsEarned;
  final List<Subjects> subjects;
  final String fileId;
  final num percentage;
  final num maxMarks;
  final num totalMarks;
  final num creditPercentage;
  final num collegeRank;
  final num universityRank;

  Result(
      this.exam,
      this.prepared,
      this.declared,
      this.semYear,
      this.creditsEarned,
      this.subjects,
      this.fileId,
      this.percentage,
      this.maxMarks,
      this.totalMarks,
      this.creditPercentage,
      this.collegeRank,
      this.universityRank);
}

//----Result Data
abstract class Programme {
  final String code;
  final String name;

  Programme(this.code, this.name);
}

abstract class Institution {
  final String code;
  final String name;

  Institution(this.code, this.name);
}

abstract class ResultData {
  final String rollNumber;
  final Programme programme;
  final Institution institution;
  final String name;
  final String batch;
  final num aggregatePercentage;
  final num aggregateCreditPercentage;
  final num maxCredits;
  final num totalCreditsEarned;
  final List<Result> results;

  ResultData(
      this.rollNumber,
      this.programme,
      this.institution,
      this.name,
      this.batch,
      this.aggregatePercentage,
      this.aggregateCreditPercentage,
      this.maxCredits,
      this.totalCreditsEarned,
      this.results);
}
