import 'package:Attendit/config/styles.dart';
import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final num sheight;

  const MyFloatingActionButton({Key key, this.sheight}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
		
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            elevation: 10.0,
            barrierColor: Color.fromRGBO(247, 247, 247, 150),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            context: context,
            builder: (context) => SingleChildScrollView(
                          child: Container(
                    color: Colors.transparent,
                    height: sheight * 0.4,
                    width: double.infinity,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(25, 20, 10, 10),
                        child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
              profile(),
              textfield(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Add Attachments",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                
                Container(
                  margin: EdgeInsets.all(20),
                  child: Align(
                    
                      alignment: Alignment.bottomRight,
                      child:Icon(Icons.send),),
                )


                ],
              ),
                          ],
                        ))),
            ));
      },
      child: Icon(Icons.add,color: Colors.white,),
      backgroundColor: Styles.colorshadow,
    );
  }
}

Widget profile() {
  return Container(
    child: Row(
      children: <Widget>[
        Container(
          //margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
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
              "https://i.pinimg.com/originals/be/ac/96/beac96b8e13d2198fd4bb1d5ef56cdcf.jpg",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5, 0, 0, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                child: Text(
                  "Joe Fox",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(29, 53, 84, 1),
                      fontWeight: FontWeight.bold),
                ),
             ),

              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(
                  "Just now",
                  style: TextStyle(
                    //fontSize: 25,
                    color: Color.fromRGBO(128, 139, 151, 1),
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),

              //Text("ved"),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget textfield() {
  return TextFormField(
    // expands: true,
    maxLines: 8,
    minLines: 6,
    decoration: new InputDecoration(
      labelStyle: TextStyle(
        color: Color.fromRGBO(168, 181, 198, 1),
      ),
      labelText: "What's on your mind?",
      fillColor: Colors.white,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      //fillColor: Colors.green
    ),

    // keyboardType: TextInputType.emailAddress,
    // style: new TextStyle(
    //  // fontFamily: "Poppins",
    // ),
  );
}
