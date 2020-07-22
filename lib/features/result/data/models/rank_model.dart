import 'package:Attendit/features/result/domain/entities/rank.dart';
import 'package:Attendit/features/result/domain/entities/result.dart';

import 'result_model.dart';

class RankModel extends Rank {
  RankModel(
      {String id,
      String name,
      num marks,
      Institution institution,
      num collegeRank,
      num universityRank})
      : super(id, name, marks, institution, collegeRank, universityRank);

  factory RankModel.fromJson(Map<String, dynamic> json) {
    return RankModel(
        id: json['id'],
        name: json['name'],
        marks: json['marks'],
        institution: InstitutionModel.fromJson(json['institution']),
        collegeRank: json['collegeRank'],
        universityRank: json['universityRank']);
  }
}
