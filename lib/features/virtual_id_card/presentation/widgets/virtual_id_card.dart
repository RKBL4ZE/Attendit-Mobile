import 'package:Attendit/config/styles.dart';
import 'package:flutter/material.dart';

class VirtualIdCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final double sheight = MediaQuery.of(context).size.height;
    //final double swidth = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[900], boxShadow: [CardStyle.boxShadow]),
        width: double.infinity,
        //height: 400,
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://getmyuni.azureedge.net/college-image/big/maharaja-surajmal-institute-of-technology-msit-new-delhi.jpg'),
                  fit: BoxFit.cover,
                ),
                gradient: Styles.colorGradientTheme,
                // borderRadius: BorderRadius.circular(15.0)
              ),
              child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                        bottom: -80,
                        //right: 10,
                        child: profile(context)),
                  ]),
            ),
            SizedBox(
              height: 80,
            ),
            Text("Chrissy Costanza",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Rubik',
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Text("Strudent",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Rubik',
                    color: Colors.orange,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
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
