
import 'package:Attendit/features/home/data/models/student_assigments_model.dart';
import 'package:flutter/material.dart';


class CompletedAssignmentWidget extends StatelessWidget {
  final List<StudentAssignmentModel> completedassignment;
  CompletedAssignmentWidget(
      {@required this.completedassignment,});


  Widget completedbuildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(

          ),
      margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      height: 50 * completedassignment.length.truncateToDouble(),
      width: double.infinity,
      child: child,
    );
  }


  @override
  Widget build(BuildContext context) {

    return InkWell(
        //  onTap: () => selectProperty(context),
        child: Container(
          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(50),
                              blurRadius: 6.0,
                              spreadRadius: 1.0,
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                            ),
                          ]),
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                
                
                Card(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Text(
                            "Completed Assignments",
                            style: TextStyle(
                              // fontFamily: 'Rubik',
                              fontSize: 20,
                              color: Color.fromRGBO(46, 96, 102, 1),
                              //  fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "TITLE",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  // fontFamily: 'Rubik',
                                  
                                  fontSize: 15,
                                  color: Color.fromRGBO(5, 160, 179, 1),
                                  //  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "SUBJECTS",
                                textAlign: TextAlign.center,
                                style: TextStyle(

                                  // fontFamily: 'Rubik',
                                  fontSize: 15,
                                  color: Color.fromRGBO(5, 160, 179, 1),
                                  //  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Marks",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  // fontFamily: 'Rubik',
                                  fontSize: 15,
                                  color: Color.fromRGBO(5, 160, 179, 1),
                                  //  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                        completedbuildContainer(
                          ListView.builder(
                            primary:
                                false, //physics: const NeverScrollableScrollPhysics()
                            itemBuilder: (ctx, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 10,
                                ),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                        flex: 2, // 20%
                                        child: Text(
                                          completedassignment[index].title,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            // fontFamily: 'Rubik',
                                            fontSize: 15,
                                            color: Color.fromRGBO(
                                                128, 139, 151, 1),
                                            //  fontWeight: FontWeight.bold
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2, // 60%
                                        child: Text(
                                          completedassignment[index].subjectName,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            // fontFamily: 'Rubik',
                                            fontSize: 15,
                                            color: Color.fromRGBO(
                                                128, 139, 151, 1),
                                            //  fontWeight: FontWeight.bold
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2, // 20%
                                        child: Text(
                                          "${completedassignment[index].marks.toString()}/${completedassignment[index].totalMarks.toString()}",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            // fontFamily: 'Rubik',
                                            fontSize: 15,
                                            color: Color.fromRGBO(
                                                128, 139, 151, 1),
                                            //  fontWeight: FontWeight.bold
                                          ),
                                        )),
                                  ],
                                )),
                            itemCount: completedassignment.length,
                          ),
                        ),
                      ]),
                ),
                
              ],
            )));
  }
}
