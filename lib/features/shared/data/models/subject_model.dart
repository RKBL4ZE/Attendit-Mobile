import 'package:Attendit/features/shared/domain/entities/subject.dart';
import 'package:meta/meta.dart';

class SubjectModel extends Subject {
  SubjectModel(
      {@required final String code,
      @required final String name,
      @required final String fullName})
      : super(code: code, name: name, fullName: fullName);

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
        code: json['code'], name: json['name'], fullName: json['fullName']);
  }

  Map<String, dynamic> toJson() {
    return {"code": code, "name": name, "fullName": fullName};
  }
}
