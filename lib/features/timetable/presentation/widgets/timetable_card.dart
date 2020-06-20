import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeTableCardWidget extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String subject;
  final String faculty;

  const TimeTableCardWidget(
      {@required this.startTime,
      @required this.endTime,
      @required this.subject,
      @required this.faculty});

  @override
  Widget build(BuildContext context) {
   List<String> startFormattime = startTime.split('');
   List<String> endFormattime = endTime.split('');

    DateFormat dateFormat = new DateFormat.Hm();
    DateTime now = DateTime.now();
    DateTime open = dateFormat.parse(
        "${startFormattime[0]}${startFormattime[1]}:${startFormattime[2]}${startFormattime[3]}");
    open = new DateTime(now.year, now.month, now.day, open.hour, open.minute);
    DateTime close = dateFormat.parse(
        "${endFormattime[0]}${endFormattime[1]}:${endFormattime[2]}${endFormattime[3]}");
    close =
        new DateTime(now.year, now.month, now.day, close.hour, close.minute);

    Color cardcolor = Colors.white;
    final currentTime = DateTime.now();

    if (currentTime.isBefore(open) && currentTime.isBefore(close)) {
      cardcolor = Colors.blue[100].withAlpha(500);
    } else if (currentTime.isAfter(open) && currentTime.isBefore(close)) {
      cardcolor = Colors.green[100];
    } else if (currentTime.isAfter(open) && currentTime.isAfter(close)) {
      cardcolor = Colors.red[100];
    }

    return InkWell(
      //  onTap: () => selectCategory(context),
      //  splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(70),
                  blurRadius: 6.0,
                  spreadRadius: 3.0,
                  offset: Offset(
                    0.0,
                    3.0,
                  ),
                ),
              ]),

          // height: 100,
          width: double.infinity,
          margin: new EdgeInsets.fromLTRB(0, 5, 0, 10),
          //padding: const EdgeInsets.all(15),
          child: Card(
              color: cardcolor,
              // elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                margin: new EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${startFormattime[0]}${startFormattime[1]} : ${startFormattime[2]}${startFormattime[3]} - ${endFormattime[0]}${endFormattime[1]} : ${endFormattime[2]}${endFormattime[3]}",
                      style: TextStyle(
                          // fontFamily: 'Rubik',
                          fontSize: 16,
                          color: Color.fromRGBO(46, 96, 102, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: new EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: AutoSizeText(
                        subject,
                        maxLines: 1,
                        style: TextStyle(
                            // fontFamily: 'Rubik',
                            fontSize: 31,
                            fontFamily: 'Rubik',
                            color: Color.fromRGBO(46, 96, 102, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    AutoSizeText(
                      "- $faculty",
                      maxLines: 1,
                      style: TextStyle(
                        // fontFamily: 'Rubik',
                        fontSize: 16,
                        color: Color.fromRGBO(46, 96, 102, 1),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
