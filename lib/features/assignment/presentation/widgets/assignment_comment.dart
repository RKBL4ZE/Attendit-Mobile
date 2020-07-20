import 'package:flutter/material.dart';

class AssignmentComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 25),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.grey.withAlpha(70),
          blurRadius: 6.0,
          spreadRadius: 4.0,
          offset: Offset(
            0.0,
            3.0,
          ),
        ),
      ]),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        //  elevation: 5.0,
        shadowColor: Color.fromRGBO(152, 214, 217, 1),
        child: TextField(
          // controller: username,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.send),
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(7, 7, 10, 7),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(70),
                    blurRadius: 6.0,
                    spreadRadius: 4.0,
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(
                  color: Colors.white70,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                child: Image.network(
                  "https://pbs.twimg.com/media/D92KtbDWkAA_0j6.jpg",
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            border: InputBorder.none,

            //  contentPadding: EdgeInsets.all(8),

            //Add th Hint text here.

            hintText: "Type here...",

            hintStyle: TextStyle(
                fontSize: 18.0, color: Color.fromRGBO(168, 181, 198, 1)),
          ),
        ),
      ),
    );
  }
}
