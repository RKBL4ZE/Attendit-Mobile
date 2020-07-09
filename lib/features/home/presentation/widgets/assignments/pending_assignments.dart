import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/assignment/presentation/pages/selected_assignment_details.dart';
import 'package:Attendit/features/home/domain/entities/student_assignment.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';

class PendingAssignmentWidget extends StatelessWidget {
  final List<StudentAssignment> pendingassignment;

  PendingAssignmentWidget({
    @required this.pendingassignment,
  });

  Widget convertTime(String utctime) {
    //   var format = DateFormat('yyyy-MM-dd').parse(utctime);

    //  // DateTime time = format.format(utctime);
    // // time.toLocal();
    var date = DateTime.parse(utctime);
    var dateFormatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = dateFormatter.format(date);

    DateFormat dateFormat = new DateFormat('yyyy-MM-dd');
    DateTime now = DateTime.now();
    DateTime open = dateFormat.parse(utctime);
    open = new DateTime(
        open.year, open.month, open.day - 3, open.hour, open.minute);
    DateTime close = dateFormat.parse(utctime);
    close =
        new DateTime(close.year, close.month, close.day, now.hour, now.minute);

    Color cardcolor = Colors.white;
    final currentTime = DateTime.now();

    if (currentTime.isBefore(open) && currentTime.isBefore(close)) {
      cardcolor = Colors.blue;
    } else if (currentTime.isAfter(open) && currentTime.isBefore(close)) {
      cardcolor = Colors.yellow;
    } else if (currentTime.isAfter(open) && currentTime.isAfter(close)) {
      cardcolor = Colors.red;
    }

    return Text(
      formattedDate,
      textAlign: TextAlign.right,
      style: TextStyle(
        // fontFamily: 'Rubik',
        fontSize: 15,
        color: cardcolor,
        //  fontWeight: FontWeight.bold
      ),
    );
  }

  Widget pendingbuildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.white,
          // border: Border.all(color: Colors.grey),
          // borderRadius: BorderRadius.circular(10),
          ),
      margin: EdgeInsets.all(10),

      /// padding: EdgeInsets.all(10),
      height: 40 * pendingassignment.length.truncateToDouble(),
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        //  onTap: () => selectProperty(context),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(50),
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  ),
                ]),
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Text(
                            "Pending Assignments",
                            style: TextStyle(
                              // fontFamily: 'Rubik',
                              fontSize: 20,
                              color: Color.fromRGBO(46, 96, 102, 1),
                              //  fontWeight: FontWeight.bold
                            ),
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
                                      style: TextStyle(
                                        // fontFamily: 'Rubik',

                                        fontSize: 15,
                                        color: Styles.colorshadow,
                                        //  fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "SUBJECTS",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        // fontFamily: 'Rubik',
                                        fontSize: 15,
                                        color: Styles.colorshadow,
                                        //  fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "Due Date",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        // fontFamily: 'Rubik',
                                        fontSize: 15,
                                        color: Styles.colorshadow,
                                        //  fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                        pendingbuildContainer(
                          ListView.builder(
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) => Container(
                              height: 40,
                              // margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.top,

                                  //  border: TableBorder.all(),
                                  //defaultColumnWidth: FixedColumnWidth(10.0),
                                  children: [
                                    TableRow(
                                      children: [
                                        AutoSizeText(
                                          pendingassignment[index].title,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            // fontFamily: 'Rubik',
                                            fontSize: 15,
                                            color: Color.fromRGBO(
                                                128, 139, 151, 1),
                                            //  fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        AutoSizeText(
                                          pendingassignment[index]
                                              .subject
                                              .subjectName,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            // fontFamily: 'Rubik',
                                            fontSize: 15,
                                            color: Color.fromRGBO(
                                                128, 139, 151, 1),
                                            //  fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Container(
                                            child: convertTime(
                                                pendingassignment[index]
                                                    .dueDate)),
                                      ],
                                    ),
                                  ]),
                            ),
                            itemCount: pendingassignment.length,
                          ),
                        ),
                      ]),
                ),
              ],
            )));
  }
}
