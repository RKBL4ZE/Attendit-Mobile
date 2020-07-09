import 'package:Attendit/config/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyFloatingActionButton extends StatelessWidget {
  // final num sheight;

  // const MyFloatingActionButton({Key key, this.sheight}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String datenow = formatter.format(now);
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            //enableDrag: false,
            //isDismissible: true,

            elevation: 10.0,
            barrierColor: Color.fromRGBO(247, 247, 247, 150),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            context: context,
            builder: (context) => SingleChildScrollView(
                  child: Container(
                      color: Colors.transparent,
                      //  height: sheight * 0.4,
                      width: double.infinity,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          text("Title"),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          TextField(
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            //controller: searchCtrl,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              hintText: 'Enter Title',
                                              hintStyle:
                                                  TextStyle(fontSize: 16),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none,
                                                ),
                                              ),
                                              filled: true,
                                              contentPadding:
                                                  EdgeInsets.all(16),
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  // Expanded(
                                  //   flex: 2,
                                  //   child: Container(
                                  //     margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                                  //     child: Column(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       children: <Widget>[
                                  //         text("Set Marks"),
                                  //         SizedBox(
                                  //           height: 8,
                                  //         ),
                                  //         TextField(
                                  //           maxLines: 1,
                                  //           textAlign: TextAlign.left,
                                  //           //controller: searchCtrl,
                                  //           keyboardType: TextInputType.text,
                                  //           decoration: InputDecoration(
                                  //             hintText: '10',
                                  //             hintStyle:
                                  //                 TextStyle(fontSize: 16),
                                  //             border: OutlineInputBorder(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(8),
                                  //               borderSide: BorderSide(
                                  //                 width: 0,
                                  //                 style: BorderStyle.none,
                                  //               ),
                                  //             ),
                                  //             filled: true,
                                  //             contentPadding:
                                  //                 EdgeInsets.all(16),
                                  //             fillColor: Colors.white,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text("Subject Name"),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextField(
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                      //controller: searchCtrl,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: 'Enter a Subject Name',
                                        hintStyle: TextStyle(fontSize: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.all(16),
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text("Description"),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextField(
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      //controller: searchCtrl,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: 'Enter a Description',
                                        hintStyle: TextStyle(fontSize: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.all(16),
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text("Class Link"),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    TextField(
                                      maxLines: 2,
                                      textAlign: TextAlign.left,
                                      //controller: searchCtrl,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: 'Enter a Class Link',
                                        hintStyle: TextStyle(fontSize: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.all(16),
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text("Date"),
                                  Container(
                                    height: 50,
                                    // width: swidth / 2.7,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: dropdowntext(datenow),
                                          ),
                                          onTap: () {
                                            var dateTimenow = DateTime.now();
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(
                                                        dateTimenow.year,
                                                        dateTimenow.month,
                                                        dateTimenow.day - 3),
                                                    lastDate: dateTimenow)
                                                .then((date) {
                                              //  setState(() {
                                              //    dateSelectedValue = DateFormat('y-M-d')
                                              //        .format(date)
                                              //        .toString();
                                              //  }
                                              //  );
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Container(
                              //     margin: EdgeInsets.fromLTRB(0, 14, 0, 14),
                              //     alignment: Alignment.bottomCenter,
                              //     height: 40.0,
                              //     child: OutlineButton(
                              //       shape: new RoundedRectangleBorder(
                              //           borderRadius:
                              //               new BorderRadius.circular(10.0)),

                              //       // textColor: Colors.blue,
                              //       child: SizedBox.expand(
                              //         child: Center(
                              //           child: Text('Add Attachments',
                              //               style: TextStyle(
                              //                 color: Color.fromRGBO(
                              //                     95, 197, 209, 1),
                              //                 fontSize: 16,
                              //                 fontWeight: FontWeight.bold,
                              //               )),
                              //         ),
                              //       ),
                              //       borderSide: BorderSide(
                              //           color: Color.fromRGBO(95, 197, 209, 1),
                              //           style: BorderStyle.solid,
                              //           width: 1.5),

                              //       onPressed: () {
                              //         //  chaneattachments();
                              //       },
                              //     )),
                              Container(
                                //margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                alignment: Alignment.bottomCenter,
                                height: 40.0,
                                child: RaisedButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(80.0)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromRGBO(95, 197, 209, 1),
                                            Color.fromRGBO(152, 214, 217, 1)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: double.infinity,
                                          minHeight: 50.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Create Online Class",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))),
                ));
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      backgroundColor: Styles.colorshadow,
    );
  }
}

Widget dropdowntext(String text) {
  return AutoSizeText(
    text,
    maxLines: 1,
    textAlign: TextAlign.left,
    style: TextStyle(
        fontSize: 16,
        // color: Color.fromRGBO(168, 181, 198, 0.5),
        fontWeight: FontWeight.bold),
  );
}

Widget text(String text) {
  return AutoSizeText(
    " $text",
    maxLines: 1,
    textAlign: TextAlign.left,
    style: TextStyle(
        fontSize: 17,
        color: Color.fromRGBO(29, 53, 84, 1),
        fontWeight: FontWeight.bold),
  );
}
