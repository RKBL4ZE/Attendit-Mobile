import 'result.dart';

abstract class Rank {
  final String id;
  final String name;
  final num marks;
  final Institution institution;
  final String rollNumber;
  final num collegeRank;
  final num universityRank;

  Rank(this.id, this.name, this.marks, this.institution, this.collegeRank,
      this.universityRank, this.rollNumber);
}
