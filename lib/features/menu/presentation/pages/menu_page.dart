import 'package:Attendit/features/navbar/presentation/pages/editprofile.dart';
import 'package:Attendit/features/result/presentation/externals/pages/external.dart';
import 'package:Attendit/features/result/presentation/internals/pages/internal.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';

class MenuPage extends StatelessWidget {
  static const routeName = '/InternalSCREEN';
  @override
  Widget build(BuildContext context) {
    final double sheight = MediaQuery.of(context).size.height;
    // final prop = Dummy_AllPropertys.toList();

    return Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        body: SingleChildScrollView(
          primary: false,
                  child: Column(
            children: <Widget>[
              Container(
                height: sheight * 0.3,
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
                child: Container(
                    margin: EdgeInsets.fromLTRB(30, sheight * 0.08, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Menu",
                            style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'Rubik',
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        profile(context),
                      ],
                    )),
              ),
              SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 30, 10, 10),
                    child: Column(
                      children: <Widget>[
                        menuContent(Icons.score, "Internal Marks",InternalPage(),context),
                        menuContent(Icons.score, "External Marks",ExternalPage(),context),
                       // menuContent(Icons.settings, "Settings"),
                       // menuContent(Icons.contact_phone, "Contact Us"),
                       // menuContent(Icons.business, "About Us"),
                      ],
                    ),
                  ),
                ],
              )),
              
            ],
          ),
        ));
  }
}

Widget menuContent(var icon, String string,Widget widget,var context) {
  return InkWell(
    onTap: (){ pushNewScreen(context, screen: widget);},
      child: Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Color.fromRGBO(128, 139, 151, 1),
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

Widget profile(var context) {
  if (MediaQuery.of(context).orientation == Orientation.portrait) {
    return Row(
      children: <Widget>[
        Container(
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
            borderRadius: BorderRadius.all(Radius.circular(50)),
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
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 15, 0, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                child: Text(
                  "Terry Ross",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: InkWell(
                  onTap: (){ },
                                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                        //fontSize: 25,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),

              //Text("ved"),
            ],
          ),
        ),
      ],
    );
  } else {
    return Text("");
  }
}
