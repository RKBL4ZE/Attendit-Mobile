import 'package:Attendit/features/assignment/data/models/student_assigments_model.dart';
import 'package:flutter/material.dart';

import 'assignment_card.dart';

class AssignmentsListWidget extends StatelessWidget {
  final String assignmentStatus;
  final List<StudentAssignmentModel> assignments;
  AssignmentsListWidget({
    @required this.assignments,
    @required this.assignmentStatus,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: new EdgeInsets.fromLTRB(0, 20, 0, 15),
            child: Text(
                assignmentStatus == "COMPLETED"
                    ? "Completed Assignment"
                    : "Pending Assignment",
                //textAlign: TextAlign.left,
                style: TextStyle(
                    // fontFamily: 'Rubik',

                    fontSize: 25,
                    fontFamily: 'Rubik',
                    color: Color.fromRGBO(46, 96, 102, 1),
                    fontWeight: FontWeight.bold)),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: double.infinity),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: assignments.length,
              // primary: false,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) => Container(
                // height: 40,
                child: AssignmentCard(
                  id: assignments[index].id,
                  subname: assignments[index].assignment.subject.fullName,
                  subjectCode: assignments[index].assignment.subject.code,
                  title: assignments[index].assignment.title,
                  description: assignments[index].assignment.description,
                  file: assignments[index].assignment.file,
                  fileName: assignments[index].assignment.fileName,
                  submitFileName: assignments[index].submitFileName,
                  marks: assignments[index].earnedMarks,
                  submitFile: assignments[index].submitFile,
                  createdAt: assignments[index].assignment.createdAt,
                  dueDate: assignments[index].assignment.dueDate,
                  faculty: assignments[index].assignment.faculty.name,
                  totalMarks: assignments[index].assignment.totalMarks,
                  status: assignments[index].status,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
