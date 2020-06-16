import 'package:flutter/material.dart';

class SemSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withAlpha(25),
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: Offset(
              0.0,
              0.0,
            ),
          ),
        ]),
        // height: 50,
        width: double.infinity,
        child: Card(
           shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Text(
                      "Sem1",
                      style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 25,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    splashColor: Colors.blue,
  borderRadius: BorderRadius.circular(25.0),
                    child: Text(
                      "Sem1",
                      style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 25,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
