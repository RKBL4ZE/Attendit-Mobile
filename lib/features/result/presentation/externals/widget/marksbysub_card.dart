import 'package:Attendit/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import '../screens/PropertyDetails_screen.dart';
//import '../models/AllProperty_model.dart';

final double radius = 70;
final double angle = 0;
final double insidefont = 20;
final Color footercolor = Color.fromRGBO(95, 197, 209, 1);
final Color textColor = Colors.black;

final double containerheight = 105;

class MarksBySub extends StatefulWidget {
  final String subname;
  final String subNameCode;
  final num internalMarksEarn;
  final num internalMarksMax;
  final num externalMarksEarn;
  final num externalMarksMax;
  final num totalMarksEarn;
  final num totalMarksMax;

  const MarksBySub(
      {Key key,
      this.subname,
      this.subNameCode,
      this.internalMarksEarn,
      this.internalMarksMax,
      this.externalMarksEarn,
      this.externalMarksMax,
      this.totalMarksEarn,
      this.totalMarksMax})
      : super(key: key);

  @override
  _MarksBySubState createState() => _MarksBySubState();
}

class _MarksBySubState extends State<MarksBySub> {
  bool bar = true;
  void chanebar() {
    // operations to be performed
    // end of operations to be performed
    setState(() {
      if (bar == false) {
        bar = true;
      } else if (bar == true) {
        bar = false;
      }
    });
  }

  Color percolor(num percentage) {
    if (percentage < 0.60) {
      return GraphStyle.low;
    } else if (percentage >= 0.60 && percentage <= 0.80) {
      return GraphStyle.mid;
    } else if (percentage > 0.80) {
      return GraphStyle.high;
    }
    return Colors.white30;
  }

  Color percolorshadow(num percolor) {
    if (percolor < 0.60) {
      return GraphStyle.lowAccent;
    } else if (percolor >= 0.60 && percolor <= 0.80) {
      return GraphStyle.midAccent;
    } else if (percolor > 0.80) {
      return GraphStyle.highAccent;
    }
    return Colors.white30;
  }

  @override
  Widget build(BuildContext context) {
    if (bar) {
      return InkWell(
          onTap: () => chanebar(),
          child: Container(
            constraints: BoxConstraints(minHeight: containerheight),
            //height: containerheight,
            width: double.infinity,
            //margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Card(
              color: ResultCardStyle.subbarColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  columnWidths: {
                    0: FlexColumnWidth(4),
                    1: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 5, 10),
                            child: Text(
                              widget.subNameCode,
                              style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 15,
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: CircularPercentIndicator(
                            backgroundColor: percolorshadow(
                                (widget.totalMarksEarn / widget.totalMarksMax)
                                    .toDouble()),
                            startAngle: angle,
                            progressColor: percolor(
                                (widget.totalMarksEarn / widget.totalMarksMax)
                                    .toDouble()),
                            circularStrokeCap: CircularStrokeCap.round,
                            // arcType: ArcType.FULL,
                            // arcBackgroundColor: Colors.white,
                            animation: true,
                            //backgroundColor: Colors.transparent,
                            animationDuration: 1000,
                            radius: radius,
                            lineWidth: 7.0,
                            percent:
                                (widget.totalMarksEarn / widget.totalMarksMax)
                                    .toDouble(),
                            //footer: Text("ve"),
                            center: new Text(
                              "${((widget.totalMarksEarn / widget.totalMarksMax) * 100).toString().split(".")[0]}%",
                              style: TextStyle(
                                  // fontFamily: 'Rubik',
                                  fontSize: insidefont,
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            //progressColor: Color.fromRGBO(95, 197, 209, 1),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ));
    } else {
      return InkWell(
          onTap: () => chanebar(),
          child: Container(
              constraints: BoxConstraints(minHeight: containerheight),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [ResultCardStyle.boxShadow]),
              // height: containerheight,
              width: double.infinity,
              // margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Card(
                borderOnForeground: true,
                color: ResultCardStyle.subbarSelectedColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.subname,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  "Internal : ${widget.internalMarksEarn}/${widget.internalMarksMax}",
                                  style: TextStyle(
                                    fontFamily: 'Karla',
                                    fontSize: 16,
                                    color: textColor,
                                    //  fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  "External : ${widget.externalMarksEarn}/${widget.externalMarksMax}",
                                  style: TextStyle(
                                    fontFamily: 'Karla',
                                    fontSize: 16,
                                    color: textColor,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Total : ${widget.totalMarksEarn}/${widget.totalMarksMax}",
                            style: TextStyle(
                                fontFamily: 'Karla',
                                fontSize: 16,
                                color: textColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )));
    }
  }
}
