import 'package:Attendit/config/styles.dart';
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
      cardcolor = LectureCardStyle.afterColor;
    } else if (currentTime.isAfter(open) && currentTime.isBefore(close)) {
      cardcolor = LectureCardStyle.currentColor;
    } else if (currentTime.isAfter(open) && currentTime.isAfter(close)) {
      cardcolor = LectureCardStyle.beforeColor;
    }

    return InkWell(
      child: Container(
          decoration: BoxDecoration(boxShadow: [LectureCardStyle.boxShadow]),
          width: double.infinity,
          child: Card(
              color: cardcolor,
              shape: LectureCardStyle.shape,
              child: Container(
                margin: new EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${startFormattime[0]}${startFormattime[1]} : ${startFormattime[2]}${startFormattime[3]} - ${endFormattime[0]}${endFormattime[1]} : ${endFormattime[2]}${endFormattime[3]}",
                      style: LectureCardStyle.textStyle,
                    ),
                    Container(
                      margin: new EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: AutoSizeText(
                        subject,
                        maxLines: 1,
                        style: LectureCardStyle.headingTextStyle,
                      ),
                    ),
                    AutoSizeText(
                      "- $faculty",
                      maxLines: 1,
                      style: LectureCardStyle.subHeadingTextStyle,
                    ),
                  ],
                ),
              ))),
    );
  }
}
