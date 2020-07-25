import 'package:Attendit/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VirtualIdCard extends StatefulWidget {
  @override
  _VirtualIdCardState createState() => _VirtualIdCardState();
}

class _VirtualIdCardState extends State<VirtualIdCard> {
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

  @override
  Widget build(BuildContext context) {
    if (bar) {
      return InkWell(
        onDoubleTap: () => chanebar(),
        child: Container(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("COMPANY NAME",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Rubik',
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold)),
                  Text("SLOGON GOES HERE",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Rubik',
                        color: Colors.blue[300],
                        //fontWeight: FontWeight.bold
                      )),
                  profile(context),
                  Text("Chrissy Costanza",
                      style: TextStyle(
                          fontSize: 27,
                          fontFamily: 'Rubik',
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold)),
                  Text("STUDENT",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Rubik',
                        color: Colors.blue[300],
                        //fontWeight: FontWeight.bold
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(35, 20, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          cardDetail(
                              head: "Enrollment No.", ans: "01220703119"),
                          cardDetail(head: "Blood", ans: "B+"),
                          cardDetail(head: "Course.", ans: "Btech"),
                          cardDetail(head: "Year", ans: "2019-2023"),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () => chanebar(),
        child: Container(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  QrImage(
                    data: "01220703119",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  Text("Chrissy Costanza",
                      style: TextStyle(
                          fontSize: 27,
                          fontFamily: 'Rubik',
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold)),
                  Text("STUDENT",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Rubik',
                        color: Colors.blue[300],
                        //fontWeight: FontWeight.bold
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(35, 20, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          cardDetail(
                              head: "Enrollment No.", ans: "01220703119"),
                          cardDetail(head: "Blood", ans: "B+"),
                          cardDetail(head: "Course.", ans: "Btech"),
                          cardDetail(head: "Year", ans: "2019-2023"),
                        ],
                      )),
                  Text("COMPANY NAME",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Rubik',
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold)),
                  Text("SLOGON GOES HERE",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Rubik',
                        color: Colors.blue[300],
                        //fontWeight: FontWeight.bold
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}

Widget profile(var context) {
  // final double sheight = MediaQuery.of(context).size.height;
  return Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withAlpha(70),
          blurRadius: 6.0,
          spreadRadius: 7.0,
          offset: Offset(
            0.0,
            3.0,
          ),
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(100)),
      border: Border.all(
        color: Colors.white70,
        width: 3,
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(100),
      ),
      child: Image.network(
        "https://note-store.com/upload/resize_cache/iblock/795/325_380_2/Chrissy-Costanza.png",
        height: 120,
        width: 120,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget cardDetail({String head, String ans}) {
  final num flex1 = 5;
  final num flex2 = 5;
  final double fontsize = 16;
  final double spacing = 6;
  return Container(
    margin: EdgeInsets.all(spacing),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: flex1,
          child: Text(
            head,
            style: TextStyle(
                // fontFamily: 'Karla',
                fontSize: fontsize,
                color: GraphStyle.primary,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: flex2,
          child: Text(
            ": $ans",
            style: TextStyle(
                // fontFamily: 'Karla',
                fontSize: fontsize,
                color: ResultCardStyle.subheadingColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
