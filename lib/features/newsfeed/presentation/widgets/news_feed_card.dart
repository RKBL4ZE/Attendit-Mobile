import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/newsfeed/domain/entities/news_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intl/intl.dart';

class NewsFeedCard extends StatefulWidget {
  NewsFeedCard({@required this.newsFeed});

  final NewsFeed newsFeed;

  @override
  _NewsFeedWIDGETState createState() => _NewsFeedWIDGETState();
}

String readTimestamp(String timestamp, String type) {
  var fdate = new DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  var date = new DateFormat("dd-MM-yyyy").format(fdate);
  var time = DateFormat("H:m:s").format(fdate);
  if (type == "date")
    return date.toString();
  else if (type == "time") return time.toString();
}

class _NewsFeedWIDGETState extends State<NewsFeedCard> {
  Color color = Colors.grey;
  bool commentbar = false;
  Color commentcolor = Colors.grey;

  @override
  void initState() {
    super.initState();
    if (widget.newsFeed.isLiked) {
      color = Colors.red;
    }
  }

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
        boxShadow: [CardStyle.boxShadow],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      //margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        CardStyle.boxShadow,
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
                        widget.newsFeed.author.profilePicture,
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
                            widget.newsFeed.author.name,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(29, 53, 84, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            readTimestamp(
                                widget.newsFeed.createdAt.toString(), "date"),
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
                child: Text(widget.newsFeed.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        // fontFamily: 'Rubik',
                        fontSize: 20,
                        color: Color.fromRGBO(29, 53, 84, 1),
                        fontWeight: FontWeight.bold))),
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: double.infinity,
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      widget.newsFeed.images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: widget.newsFeed.images.length,
                itemWidth: 200.0,
                layout: SwiperLayout.STACK,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 15, 10),
              child: Text(
                widget.newsFeed.text,
                style: TextStyle(
                  // fontFamily: 'Rubik',
                  fontSize: 14,
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
                          "${widget.newsFeed.likesCount} Likes. ${widget.newsFeed.likesCount} Comments",
                          textAlign: TextAlign.left,
                          style: CardStyle.textStyle,
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
                    boxShadow: [CardStyle.boxShadow]),
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
                          boxShadow: [CardStyle.boxShadow],
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
                            widget.newsFeed.author.profilePicture,
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
