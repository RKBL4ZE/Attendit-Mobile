import 'package:Attendit/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class SelectedAssignmentDetails extends StatelessWidget {
  final String id;
  final String title;
  final String facultyname;
  final String submitFile;
  final String subjectCode;
  final String subjectName;
  final String status;
  final String marks;
  final String totalMarks;
  final String createdAt;
  final String dueDate;

  const SelectedAssignmentDetails(
      {Key key,
      this.id,
      this.title,
      this.facultyname,
      this.submitFile,
      this.subjectCode,
      this.subjectName,
      this.status,
      this.marks,
      this.totalMarks,
      this.createdAt,
      this.dueDate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;
    Widget menuContent(var icon, String string, Widget widget, var context) {
      return InkWell(
        onTap: () {
          //  pushNewScreen(context, screen: widget);
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: Colors.red,
                //color: Color.fromRGBO(128, 139, 151, 1),
                size: 20.0,
              ),
              SizedBox(
                width: 25,
              ),
              Text(string,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Rubik',
                      color: Color.fromRGBO(128, 139, 151, 1),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //  mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Rubik',
                    color: Styles.colorshadow.withAlpha(1000),
                    //fontWeight: FontWeight.bold
                  )),
              SizedBox(
                height: 10,
              ),
              Text("100 points"),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  //Add th Hint text here.
                  prefixIcon: Icon(Icons.comment),
                  suffixIcon: Icon(Icons.send),
                  hintText: "Add Class Comment",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("all Faculty detail"),
              SizedBox(
                height: 15,
              ),
              Text("Attachments",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Rubik',
                    color: Colors.grey,
                    //fontWeight: FontWeight.bold
                  )),
              menuContent(Icons.image, "Assignment.jpg", Text(""), context),
            ],
          )),
        ),
        bottomSheet: SolidBottomSheet(
          maxHeight: sheight - 210,
          // toggleVisibilityOnTap: true,
          // controller: _controller,
          draggableBody: true,
          canUserSwipe: true,
          autoSwiped: true,
          headerBar: Card(
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Container(
              //  color: Styles.colorshadow.withAlpha(5000),
              // height: 50,
              child: Container(
                  child: Column(
                children: <Widget>[
                  Icon(Icons.arrow_upward),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Your Work",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Rubik',
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text("Status",
                            style: TextStyle(
                              fontSize: 14,
                              //fontFamily: 'Rubik',
                              color: Colors.black,
                              // fontWeight: FontWeight.bold
                            )),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ),
          body: Scaffold(body: Text("data")),
        ));
  }
}
