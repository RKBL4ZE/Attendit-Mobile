import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/profile/presentation/widgets/image_dialoge.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  final String profileURL;
  final String name;
  final String enrollmentNo;
  final String course;
  final String semester;
  final String section;
  final String mobileNo;
  final String email;

  const EditProfile(
      {this.profileURL,
      this.name,
      this.enrollmentNo,
      this.course,
      this.semester,
      this.section,
      this.mobileNo,
      this.email});

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
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    profileURL,
                  ),
                )),
                child: Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                          child: Positioned(
                        top: 40,
                        //bottom: 20,
                        left: 20,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                      )),
                      Positioned(
                          bottom: -sheight * 0.1,
                          //right: 10,
                          child: profile(context, profileURL)),
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
                              hintText: name,
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
                              hintText: enrollmentNo,
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
                                    hintText: course,
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
                                    hintText: semester,
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
                                    hintText: section,
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
                              hintText: mobileNo,
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
                              hintText: email,
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

Widget profile(var context, String profileURL) {
  final double sheight = MediaQuery.of(context).size.height;
  return InkWell(
    onTap: () async {
      await showDialog(
          context: context,
          builder: (_) => ImageDialog(
                imgurl: profileURL,
                context: context,
              ));
    },
    child: Container(
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
          profileURL,
          height: sheight * 0.2,
          width: sheight * 0.2,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget bottombutton() {
  return Container(
    margin: EdgeInsets.fromLTRB(70, 15, 70, 15),
    //alignment: Alignment.bottomCenter,
    height: 45.0,
    child: RaisedButton(
      shape: LectureCardStyle.shape,
      color: LectureCardStyle.buttonColor,
      onPressed: () {
        // pushNewScreen(context,
        //     screen: FullTimeTablePage(
        //       group: group,
        //     ));
        // Navigate to Full Timetable
      },
      /* shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)), */
      child: Container(
        //constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
        alignment: Alignment.center,
        child: Text(
          "Request Changes",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
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
          color: Styles.headingfontcolor,
          fontWeight: FontWeight.bold));
}
