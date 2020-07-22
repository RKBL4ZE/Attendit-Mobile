import 'package:Attendit/config/styles.dart';

import 'package:Attendit/features/timetable/domain/entities/timetable.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String MONDAY = "monday";
const String TUESDAY = "tuesday";
const String WEDNESDAY = "wednesday";
const String THURSDAY = "thursday";
const String FRIDAY = "friday";
const String SATURDAY = "saturday";
const String SUNDAY = "sunday";

final timings = Set<String>();

void createTimetableByDay(
    {Map<String, Map<String, String>> form, String day, Timing timing}) {
  if (!timings.contains(timing)) {
    timings.add(timing.startTime + timing.endTime);
  }
  form.forEach((key, value) {
    String subjectName = timing.subject.name;
    if (key == day) {
      // TO:DO UNSAFE CODE NEED REFACTOR

      form[day][timing.startTime + timing.endTime] = subjectName;
    } else {
      if (!value.containsKey(timing.startTime + timing.endTime)) {
        value[timing.startTime + timing.endTime] = "-";
      }
    }
  });
}

List<Widget> _buildDayRows(Map<String, Map<String, String>> form, String day) {
  String date = DateFormat('EEEE').format(DateTime.now());
  final widgets = List<Widget>();
  Color colorshadow = Colors.transparent;
  if (day.toLowerCase() == date.toLowerCase()) {
    colorshadow = fulltimeTablePrimaryColor;
  }
  timings.forEach((element) {
    widgets.add(Container(color: colorshadow, child: text(form[day][element])));
    // widgets.add(text(form[day][element], element));
  });
  return widgets;
}

List<Widget> _buildTimeRows(
  Map<String, Map<String, String>> form,
) {
  final widgets = List<Widget>();

  timings.forEach((element) {
    String time = element.toString();

    String timeformat = "";

    time.split('').asMap().forEach((key, value) {
      timeformat += '$value';
      if (key == 1 || key == 5) {
        timeformat += ':';
      }
      if (key == 3) {
        timeformat += '-';
      }
    });

    // String timeformat =
    //     "${time.split("")[0]}${time.split("")[1]}:${time.split("")[2]}${time.split("")[3]}${time.split("")[4]}${time.split("")[5]}${time.split("")[6]}:${time.split("")[7]}";
    widgets.add(AutoSizeText(
      timeformat,
      maxLines: 1,
    ));
  });
  return widgets;
}

class FullTimeTablePage extends StatelessWidget {
  final List<Group> group;

  const FullTimeTablePage({Key key, this.group}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final fulltimetable = group[0].timetable;
    // final TimeTableModel full = ModalRoute.of(context).settings.arguments;
    //return Text(fulltimetable.friday[0].facultyName);
    final form = Map<String, Map<String, String>>();

    form[MONDAY] = Map<String, String>();
    form[TUESDAY] = Map<String, String>();
    form[WEDNESDAY] = Map<String, String>();
    form[THURSDAY] = Map<String, String>();
    form[FRIDAY] = Map<String, String>();
    form[SATURDAY] = Map<String, String>();
    form[SUNDAY] = Map<String, String>();

    for (var timing in fulltimetable.monday) {
      createTimetableByDay(form: form, day: MONDAY, timing: timing);
    }
    for (var timing in fulltimetable.tuesday) {
      createTimetableByDay(form: form, day: TUESDAY, timing: timing);
    }
    for (var timing in fulltimetable.wednesday) {
      createTimetableByDay(form: form, day: WEDNESDAY, timing: timing);
    }
    for (var timing in fulltimetable.thursday) {
      createTimetableByDay(form: form, day: THURSDAY, timing: timing);
    }
    for (var timing in fulltimetable.friday) {
      createTimetableByDay(form: form, day: FRIDAY, timing: timing);
    }
    for (var timing in fulltimetable.saturday) {
      createTimetableByDay(form: form, day: SATURDAY, timing: timing);
    }
    // for (var timing in fulltimetable.sunday) {
    //   createTimetableByDay(form: form, day: MONDAY, timing: timing);
    // }

    int turns = 0;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      turns = 1;
    } else {
      turns = 4;
    }

    return Scaffold(
      body: RotatedBox(
          quarterTurns: turns,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                // width: double.infinity,
                // height: double.infinity,
                margin: EdgeInsets.all(10),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [Text(""), ..._buildTimeRows(form)]),
                    TableRow(children: [
                      colortext("MONDAY"),
                      ..._buildDayRows(form, MONDAY)
                    ]),
                    TableRow(children: [
                      colortext("TUESDAY"),
                      ..._buildDayRows(form, TUESDAY)
                    ]),
                    TableRow(children: [
                      colortext("WEDNESDAY"),
                      ..._buildDayRows(form, WEDNESDAY)
                    ]),
                    TableRow(children: [
                      colortext("THURSDAY"),
                      ..._buildDayRows(form, THURSDAY)
                    ]),
                    TableRow(children: [
                      colortext("FRIDAY"),
                      ..._buildDayRows(form, FRIDAY)
                    ]),
                    TableRow(children: [
                      colortext("SATURDAY"),
                      ..._buildDayRows(form, SATURDAY)
                    ]),
                    TableRow(children: [
                      colortext("SUNDAY"),
                      ..._buildDayRows(form, SUNDAY)
                    ]),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

Widget text(
  String text,
) {
  //  if (subject==null){subject= "-";}
  //  if (time==null){time= "-";}
  return Container(
    child: Column(
      children: <Widget>[
        // Text(""),
        AutoSizeText(
          text == null ? "" : text,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            // fontFamily: 'Rubik',
            fontSize: 15,
            // color: Color.fromRGBO(
            //     128, 139, 151, 1),
            //  fontWeight: FontWeight.bold
          ),
        ),
        Text(""),
      ],
    ),
  );
}

Widget colortext(String text) {
  String date = DateFormat('EEEE').format(DateTime.now());
  Color colorshadow = Colors.transparent;
  if (text.toLowerCase() == date.toLowerCase()) {
    colorshadow = fulltimeTablePrimaryColor;
  }
  return Container(
    color: colorshadow,
    child: Column(
      children: <Widget>[
        // Text(""),
        AutoSizeText(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            // fontFamily: 'Rubik',
            fontSize: 15,
            // color: Color.fromRGBO(
            //     128, 139, 151, 1),
            //  fontWeight: FontWeight.bold
          ),
        ),
        Text(""),
      ],
    ),
  );
}
