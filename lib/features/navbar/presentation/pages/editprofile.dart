import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  static const routeName = '/InternalSCREEN';
  @override
  Widget build(BuildContext context) {
    final double sheight = MediaQuery.of(context).size.height;
    final double swidth = MediaQuery.of(context).size.width;
    // final prop = Dummy_AllPropertys.toList();

    return Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: sheight * 0.21,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(95, 197, 209, 1),
                      Color.fromRGBO(152, 214, 217, 1)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  // borderRadius: BorderRadius.circular(15.0)
                ),
                child: Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                          child: Positioned(
                        top: 40,
                        //bottom: 20,
                        left: 40,
                        child: Text("Profile Details",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Rubik',
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )),
                      Positioned(
                          bottom: -sheight * 0.1,
                          //right: 10,
                          child: profile(context)),
                    ]),
              ),
              Container(
                //height: 350,
                // width: double.infinity,
                margin: EdgeInsets.fromLTRB(20, sheight * 0.1, 20, 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text("Full Name"),
                          TextField(
                            // controller: title,
                            decoration: InputDecoration(
                              //Add th Hint text here.
                              hintText: "Terry Ross",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text("Enrollment Number"),
                          TextField(
                            // controller: title,
                            decoration: InputDecoration(
                              //Add th Hint text here.
                              hintText: "08914902017",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: swidth * 0.25,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text("Course"),
                                TextField(
                                  // controller: title,
                                  decoration: InputDecoration(
                                    //Add th Hint text here.
                                    hintText: "BCA",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: swidth * 0.25,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text("Semester"),
                                TextField(
                                  // controller: title,
                                  decoration: InputDecoration(
                                    //Add th Hint text here.
                                    hintText: "6",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: swidth * 0.25,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text("Section"),
                                TextField(
                                  // controller: title,
                                  decoration: InputDecoration(
                                    //Add th Hint text here.
                                    hintText: "A",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text("Mobile Number"),
                          TextField(
                            // controller: title,
                            decoration: InputDecoration(
                              //Add th Hint text here.
                              hintText: "9899576827",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text("Email"),
                          TextField(
                            // controller: title,
                            decoration: InputDecoration(
                              //Add th Hint text here.
                              hintText: "terryross@gmail.com",
                            ),
                          ),
                        ],
                      ),
                    ),
                    bottombutton(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

Widget profile(var context) {
  final double sheight = MediaQuery.of(context).size.height;
  return Container(
    margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
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
        "https://img1.kpopmap.com/2016/11/twice-tzuyu-pretty-side-profile-kpop-girl-group-idols.jpg",
        height: sheight * 0.2,
        width: sheight * 0.2,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget bottombutton() {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
    //alignment: ,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(95, 197, 209, 1),
        blurRadius: 5.0,
        spreadRadius: 0.0,
        offset: Offset(
          0.0,
          0.0,
        ),
      ),
    ]),
    height: 50.0,
    child: RaisedButton(
      onPressed: () {
        // Navigator.of(context).pushReplacementNamed(
        //   TabsScreen.routeName,
        // );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(95, 197, 209, 1),
                Color.fromRGBO(152, 214, 217, 1)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            "Request Changes",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget text(String text) {
  return Text(text,
      style: TextStyle(
          fontSize: 15,
          fontFamily: 'Rubik',
          color: Color.fromRGBO(29, 53, 84, 1),
          fontWeight: FontWeight.bold));
}
