import 'package:Attendit/features/home/domain/entities/student_assignment.dart';
import 'package:flutter/material.dart';

class PendingAssignmentWidget extends StatelessWidget {
  final List<StudentAssignment> pendingassignment;

  PendingAssignmentWidget({
    @required this.pendingassignment,
  });

  Widget pendingbuildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.white,
          // border: Border.all(color: Colors.grey),
          // borderRadius: BorderRadius.circular(10),
          ),
      margin: EdgeInsets.all(10),

      /// padding: EdgeInsets.all(10),
      height: 50 * pendingassignment.length.truncateToDouble(),
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
                    spreadRadius: 2.0,
                    offset: Offset(
                      0.0,
                      2.0,
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
                  // elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Text(
                            "Pending Assignments",
                            style: TextStyle(
                              // fontFamily: 'Rubik',
                              fontSize: 20,
                              color: Color.fromRGBO(46, 96, 102, 1),
                              //  fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                           margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Table(
                                // border: TableBorder.all(),
                                children: [
                                  TableRow(
                                    children: [
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
                                        "Due Date",
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
                                ]),
                          ),
                        pendingbuildContainer(
                          ListView.builder(
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) => Container(
                              height: 40,
                              
                              child: Table(
                                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                                
                                //  border: TableBorder.all(),
                                 defaultColumnWidth: FixedColumnWidth(10.0),
                                children: [
                                  TableRow(
                                    
                                    children: [
                                      Text(
                                       pendingassignment[index].title,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          // fontFamily: 'Rubik',
                                          fontSize: 15,
                                          color: Color.fromRGBO(
                                              128, 139, 151, 1),
                                          //  fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        pendingassignment[index].subjectName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          // fontFamily: 'Rubik',
                                          fontSize: 15,
                                          color: Color.fromRGBO(
                                              128, 139, 151, 1),
                                          //  fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        pendingassignment[index].dueDate,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          // fontFamily: 'Rubik',
                                          fontSize: 15,
                                          color: Color.fromRGBO(
                                              128, 139, 151, 1),
                                          //  fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                            ),
                            itemCount: pendingassignment.length,
                          ),
                        ),
                      ]),
                ),
              ],
            )));
  }
}
