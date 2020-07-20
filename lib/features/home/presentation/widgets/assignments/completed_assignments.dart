import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/home/data/models/student_assigments_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CompletedAssignmentWidget extends StatelessWidget {
  final List<StudentAssignmentModel> completedassignment;
  CompletedAssignmentWidget({
    @required this.completedassignment,
  });

  Widget completedbuildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(),
      margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      height: 40 * completedassignment.length.truncateToDouble(),
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        //  onTap: () => selectProperty(context),
        child: Container(
             margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            decoration: BoxDecoration(boxShadow: [CardStyle.boxShadow]),
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                      //  elevation: 5,
                     // margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                           margin: EdgeInsets.all(15),
                            child: Text(
                              "Completed Assignments",
                              style: CardStyle.headingStyle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Table(
                                // border: TableBorder.all(),
                                children: [
                                  TableRow(
                                    children: [
                                      Text(
                                        "TITLE",
                                        textAlign: TextAlign.left,
                                        style: CardStyle.subHeadingStyle,
                                      ),
                                      Text(
                                        "SUBJECTS",
                                        textAlign: TextAlign.center,
                                        style: CardStyle.subHeadingStyle,
                                      ),
                                      Text(
                                        "Marks",
                                        textAlign: TextAlign.right,
                                        style: CardStyle.subHeadingStyle,
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                          completedbuildContainer(
                            ListView.builder(
                              itemCount: completedassignment.length,
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx, index) => Container(
                                height: 40,
                                child: Table(
                                    //  border: TableBorder.all(),
                                    // defaultColumnWidth: FixedColumnWidth(5.0),
                                    children: [
                                      TableRow(
                                        children: [
                                          AutoSizeText(
                                            completedassignment[index].title,
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: CardStyle.textStyle,
                                          ),
                                          AutoSizeText(
                                            completedassignment[index]
                                                .subject
                                                .subjectName,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: CardStyle.textStyle,
                                          ),
                                          Text(
                                            "${completedassignment[index].marks.toString()}/${completedassignment[index].totalMarks.toString()}",
                                            textAlign: TextAlign.right,
                                            style: CardStyle.textStyle,
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ))
                ])));
  }
}
