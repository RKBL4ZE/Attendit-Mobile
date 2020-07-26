import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String imgurl;
  final BuildContext context;

  const ImageDialog({this.imgurl, this.context});
  @override
  Widget build(context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          constraints: BoxConstraints(maxHeight: 400),
          child: Column(
            children: <Widget>[
              Container(
                // height: 300,
                width: double.infinity,
                child: Image.network(imgurl),
              ),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ListTile(
                    title: Icon(Icons.edit),
                  ))
            ],
          ),
        ));
  }
}
