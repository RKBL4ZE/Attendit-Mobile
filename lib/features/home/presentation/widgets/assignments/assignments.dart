import 'package:Attendit/features/home/data/models/student_assigments_model.dart';
import 'package:Attendit/features/home/presentation/widgets/assignments/completed_assignments.dart';
import 'package:Attendit/features/home/presentation/widgets/assignments/pending_assignments.dart';
import 'package:Attendit/features/static_pages/completed_assignment.dart';
import 'package:Attendit/features/static_pages/pending_assignment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';

class AssignmentsWidget extends StatelessWidget {
  final List<StudentAssignmentModel> assignments;

  AssignmentsWidget({@required this.assignments});
  @override
  Widget build(BuildContext context) {
    var completed = List<StudentAssignmentModel>();
    var pending = List<StudentAssignmentModel>();
    assignments.forEach((e) {
      if (e.status == "PENDING")
        pending.add(e);
      else
        completed.add(e);
    });

    return Column(
      children: <Widget>[
        InkWell(
            onTap: () {
              pushNewScreen(context, screen: CompletedAssignment());
            },
            child: CompletedAssignmentWidget(completedassignment: completed)),
        InkWell(
            onTap: () {
              pushNewScreen(context, screen: PendingAssignment());
            },
            child: PendingAssignmentWidget(pendingassignment: pending)),
      ],
    );
  }
}
