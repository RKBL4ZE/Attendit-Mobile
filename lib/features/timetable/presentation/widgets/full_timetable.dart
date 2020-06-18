import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:flutter/material.dart';




class FullTimeTablePage extends StatelessWidget {
final TimeTableModel fulltimetable;

  const FullTimeTablePage({Key key, this.fulltimetable}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   // final TimeTableModel full = ModalRoute.of(context).settings.arguments;
    //return Text(fulltimetable.friday[0].facultyName);

List<TimingModel> monday;
for(int i=0;i<fulltimetable.monday.length;i++)
{
  
}




    return RotatedBox(
      quarterTurns: 1,
      child: Container(
      margin: EdgeInsets.all(40),
      child: 
      Table(
            border: TableBorder.all(),
            children: [
              TableRow(children: [
                Text("Mon"),
                Text("Tue"),
                Text("Wed"),
                Text("Thu"),
                Text("Fri"),
                Text("Sat")
              ]),
            



              TableRow(children: [
                text(fulltimetable.monday[0].subjectName, fulltimetable.friday[0].time),
                text(fulltimetable.tuesday[0].subjectName, fulltimetable.friday[0].time),
                text(fulltimetable.wednesday[0].subjectName, fulltimetable.friday[0].time),
                text(fulltimetable.thursday[0].subjectName, fulltimetable.friday[0].time),
                text(fulltimetable.friday[0].subjectName, fulltimetable.friday[0].time),
                text(fulltimetable.saturday[0].subjectName, fulltimetable.friday[0].time),
              ]),


               TableRow(children: [
                text(fulltimetable.monday[1].subjectName, fulltimetable.friday[1].time),
                text(fulltimetable.tuesday[1].subjectName, fulltimetable.friday[1].time),
                text(fulltimetable.wednesday[1].subjectName, fulltimetable.friday[1].time),
                text(fulltimetable.thursday[1].subjectName, fulltimetable.friday[1].time),
                text(fulltimetable.friday[1].subjectName, fulltimetable.friday[1].time),
                text(fulltimetable.saturday[1].subjectName, fulltimetable.friday[1].time),
              ]),
              
              TableRow(children: [
                text(fulltimetable.monday[2].subjectName, fulltimetable.friday[2].time),
                text(fulltimetable.tuesday[2].subjectName, fulltimetable.friday[2].time),
                text(fulltimetable.wednesday[2].subjectName, fulltimetable.friday[2].time),
                text(fulltimetable.thursday[2].subjectName, fulltimetable.friday[2].time),
                text(fulltimetable.friday[2].subjectName, fulltimetable.friday[2].time),
                text(fulltimetable.saturday[1].subjectName, fulltimetable.friday[1].time),
              ]),
              


            ],
    ),
    ));
  }
}



Widget text (String subject,String time){

  //  if (subject==null){subject= "-";}
  //  if (time==null){time= "-";}
  return Column(
    children: <Widget>[
      Text(subject.toString()),Text(time.toString()),
    ],
  );
}



