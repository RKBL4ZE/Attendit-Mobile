import 'package:flutter/material.dart';

import '../../../domain/entities/result.dart';
import 'marksbysub_card.dart';

class SubjectMarksList extends StatelessWidget {
  final List<Subjects> subjects;

  const SubjectMarksList({this.subjects});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: double.infinity),
      child: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          int internalEarn = int.tryParse(subjects[index].minor.earned) ?? 0;
          int externalEarn = int.tryParse(subjects[index].major.earned) ?? 0;
          int totalEarn = int.tryParse(subjects[index].total.earned) ?? 0;
          return MarksBySub(
            subname: subjects[index].name,
            subNameCode: subjects[index].name,
            internalMarksMax: subjects[index].minor.max,
            internalMarksEarn: internalEarn,
            externalMarksMax: subjects[index].major.max,
            externalMarksEarn: externalEarn,
            totalMarksMax: subjects[index].total.max,
            totalMarksEarn: totalEarn,
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
