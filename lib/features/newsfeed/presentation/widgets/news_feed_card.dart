import 'package:Attendit/features/newsfeed/domain/entities/news_feed.dart';
import 'package:flutter/material.dart';
//import '../screens/PropertyDetails_screen.dart';
//import '../models/AllProperty_model.dart';

class NewsFeedCard extends StatefulWidget {
  final NewsFeed newsFeed;

  NewsFeedCard({@required this.newsFeed});

  @override
  _NewsFeedWIDGETState createState() => _NewsFeedWIDGETState();
}

class _NewsFeedWIDGETState extends State<NewsFeedCard> {
  bool commentbar = false;
  Color commentcolor = Colors.grey;
  Color color = Colors.grey;

  void showcommentbar() {
    // operations to be performed
    // end of operations to be performed
    setState(() {
      if (commentbar == true) {
        commentbar = false;
        commentcolor = Colors.grey;
      } else if (commentbar == false) {
        commentbar = true;
        commentcolor = Colors.blue;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.newsFeed.isLiked) {
      color = Colors.red;
    }
  }

  void makeFavorite() {
    // operations to be performed
    // end of operations to be performed
    setState(() {
      if (color == Colors.red) {
        color = Colors.grey;
      } else if (color == Colors.grey) {
        color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
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
                        widget.newsFeed.authorAvatar,
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
                            widget.newsFeed.authorName,
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromRGBO(29, 53, 84, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            widget.newsFeed.postTime.toString(),
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
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 15, 10),
              child: Text(
                widget.newsFeed.data,
                style: TextStyle(
                  // fontFamily: 'Rubik',
                  fontSize: 15,
                  color: Color.fromRGBO(29, 53, 84, 1),
                  //  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(25, 5, 15, 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${widget.newsFeed.likesCount} Likes. ${widget.newsFeed.commentsCount} Comments",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            // fontFamily: 'Rubik',
                            fontSize: 15,
                            color: Color.fromRGBO(128, 139, 151, 1),
                            //  fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            makeFavorite();
                          },
                          child: Icon(
                            Icons.favorite,
                            color: color,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            showcommentbar();
                          },
                          child: Icon(
                            Icons.comment,
                            color: commentcolor,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            if (commentbar == true)
              (Container(
                margin: EdgeInsets.fromLTRB(17, 0, 17, 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                            widget.newsFeed.authorAvatar,
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
                          fontSize: 18.0,
                          color: Color.fromRGBO(168, 181, 198, 1)),
                    ),
                  ),
                ),
              ))
          ],
        ),
      ),
    );
  }
}
