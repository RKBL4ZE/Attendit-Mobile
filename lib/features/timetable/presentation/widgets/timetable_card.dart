import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeTableCardWidget extends StatelessWidget {
  final String time;
  final String subjectName;
  final String facultyName;

  const TimeTableCardWidget(
      {@required this.time,
      @required this.subjectName,
      @required this.facultyName});

  @override
  Widget build(BuildContext context) {
    List<String> formattime = time.split('');

    DateFormat dateFormat = new DateFormat.Hm();
    DateTime now = DateTime.now();
    DateTime open = dateFormat.parse(
        "${formattime[0]}${formattime[1]}:${formattime[2]}${formattime[3]}");
    open = new DateTime(now.year, now.month, now.day, open.hour, open.minute);
    DateTime close = dateFormat.parse(
        "${formattime[5]}${formattime[6]}:${formattime[7]}${formattime[8]}");
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
                      "${formattime[0]}${formattime[1]} : ${formattime[2]}${formattime[3]} - ${formattime[5]}${formattime[6]} : ${formattime[7]}${formattime[8]}",
                      style: TextStyle(
                          // fontFamily: 'Rubik',
                          fontSize: 16,
                          color: Color.fromRGBO(46, 96, 102, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: new EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        subjectName,
                        style: TextStyle(
                            // fontFamily: 'Rubik',
                            fontSize: 31,
                            fontFamily: 'Rubik',
                            color: Color.fromRGBO(46, 96, 102, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "- ${facultyName}",
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
