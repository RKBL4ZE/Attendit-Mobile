import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../../assignment/presentation/pages/assignment_details.dart';
import '../../../data/models/student_assigments_model.dart';
import 'completed_assignments.dart';
import 'pending_assignments.dart';

class AssignmentsWidget extends StatelessWidget {
  final List<StudentAssignmentModel> assignments;

  final completed = List<StudentAssignmentModel>();
  final pending = List<StudentAssignmentModel>();

  AssignmentsWidget({@required this.assignments}) {
    assignments.forEach((e) {
      if (e.status == "PENDING")
        pending.add(e);
      else
        completed.add(e);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
            onTap: completed.length != 0
                ? () {
                    pushNewScreen(context,
                        screen: AssignmentPage(assignmentStatus: "COMPLETED"));
                  }
                : null,
            child: CompletedAssignmentWidget(completedassignment: completed)),
        InkWell(
            onTap: pending.length != 0
                ? () {
                    pushNewScreen(context,
                        screen: AssignmentPage(assignmentStatus: "PENDING"));
                  }
                : null,
            child: PendingAssignmentWidget(pendingassignment: pending)),
      ],
    );
  }
}
