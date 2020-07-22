import 'package:Attendit/config/styles.dart';
import 'package:flutter/material.dart';

class StudentNameCard extends StatelessWidget {
  final String name;
  final String enrollmentno;
  final String course;
  final String sclass;
  final String shift;

  const StudentNameCard(
      {Key key,
      this.name = "Chrissy Costanza",
      this.enrollmentno = "0122070319",
      this.course = "Bca",
      this.sclass = "Bca 106",
      this.shift = "Morning"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [CardStyle.boxShadow]),
        width: double.infinity,
        // margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Card(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          // elevation: 5,
          margin: EdgeInsets.all(10),
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  cardDetail(head: "Name", ans: name),
                  cardDetail(head: "Enrollment Number", ans: enrollmentno),
                  cardDetail(head: "Course", ans: course),
                  cardDetail(head: "Class", ans: sclass),
                  cardDetail(head: "Shift", ans: shift),
                  cardDetail(head: "CGPA", ans: "4.99"),
                  cardDetail(head: "SGPA", ans: "6.49"),
                ]),
          ),
        ));
  }
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
            ":   $ans",
            style: TextStyle(
                // fontFamily: 'Karla',
                fontSize: fontsize,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
