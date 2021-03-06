import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/home/domain/entities/student_assignment.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    var dateFormatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = dateFormatter.format(date);

    DateFormat dateFormat = new DateFormat('dd-MM-yyyy');
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
      cardcolor = GraphStyle.high;
    } else if (currentTime.isAfter(open) && currentTime.isBefore(close)) {
      cardcolor = GraphStyle.mid;
    } else if (currentTime.isAfter(open) && currentTime.isAfter(close)) {
      cardcolor = GraphStyle.low;
    }

    return AutoSizeText(
      formattedDate,
      overflow: CardStyle.overflow,
      maxLines: CardStyle.maxLines,
      minFontSize: CardStyle.minFontSize,
      maxFontSize: CardStyle.maxFontSize,
      textAlign: TextAlign.right,
      style: TextStyle(
        color: cardcolor,
        //decoration: TextDecoration.underline,
        //decorationColor: Colors.red,
        //decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

//   Widget pendingbuildContainer(Widget child) {
//     return Container(
//       decoration: BoxDecoration(
//           // color: Colors.white,
//           // border: Border.all(color: Colors.grey),
//           // borderRadius: BorderRadius.circular(10),
//           ),
//       margin: EdgeInsets.all(10),

//       /// padding: EdgeInsets.all(10),
//       height: 40 * pendingassignment.length.truncateToDouble(),
//       width: double.infinity,
//       child: child,
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //  onTap: () => selectProperty(context),
      child: Container(
        decoration: BoxDecoration(boxShadow: [CardStyle.boxShadow]),
        //margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              // elevation: 5,
              // margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Pending Assignments",
                      style: CardStyle.headingStyle,
                    ),
                  ),
                  pendingassignment.length != 0
                      ? Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Table(
                              columnWidths: CardStyle.tablecolumnWidths,
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
                                      textAlign: TextAlign.left,
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
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: double.infinity),
                      child: pendingassignment.length != 0
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (ctx, index) => Container(
                                // height: 40,
                                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  columnWidths: CardStyle.tablecolumnWidths,
                                  children: [
                                    TableRow(
                                      children: [
                                        AutoSizeText(
                                          pendingassignment[index]
                                              .assignment
                                              .title,
                                          textAlign: TextAlign.left,
                                          overflow: CardStyle.overflow,
                                          maxLines: CardStyle.maxLines,
                                          minFontSize: CardStyle.minFontSize,
                                          maxFontSize: CardStyle.maxFontSize,
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
                                              .assignment
                                              .subject
                                              .fullName,
                                          overflow: CardStyle.overflow,
                                          maxLines: CardStyle.maxLines,
                                          minFontSize: CardStyle.minFontSize,
                                          maxFontSize: CardStyle.maxFontSize,
                                          textAlign: TextAlign.left,
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
                                                    .assignment
                                                    .dueDate)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              itemCount: pendingassignment.length,
                            )
                          : Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Text(
                                  'You do not have any pending assignment'),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
