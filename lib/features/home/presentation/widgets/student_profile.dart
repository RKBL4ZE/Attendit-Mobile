import 'package:Attendit/config/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StudentProfileWidget extends StatelessWidget {
  final String enrollmentno;
  final String studentname;
  final String studentimg;
  final String othrdetail;

  StudentProfileWidget(
      {@required this.enrollmentno,
      @required this.studentname,
      @required this.studentimg,
      @required this.othrdetail});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return InkWell(
        //  onTap: () => selectProperty(context),
        child: Container(
      margin: EdgeInsets.fromLTRB(15, 30, 15, 10),
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
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
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(11),
              ),
              child: Image.network(
                studentimg,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: swidth * 0.45,
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: AutoSizeText(
                    studentname,
                    maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 25,
                        color: Styles.headingfontcolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text(
                    "#$enrollmentno",
                    style: TextStyle(
                      //fontSize: 25,
                      color: Color.fromRGBO(128, 139, 151, 1),
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: AutoSizeText(
                    othrdetail,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      //fontSize: 25,
                      color: Color.fromRGBO(128, 139, 151, 1),
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                //Text("ved"),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
