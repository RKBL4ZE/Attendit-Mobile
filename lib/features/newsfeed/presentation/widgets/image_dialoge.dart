import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDialog extends StatelessWidget {
  final String imgurl;
  final BuildContext context;

  const ImageDialog({this.imgurl, this.context});
  @override
  Widget build(context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 300,
          width: double.infinity,
          child: PhotoView(
            backgroundDecoration: BoxDecoration(color: Colors.transparent),
            imageProvider: NetworkImage(
              imgurl,
              // height: 300,
              // width: 300,
              // fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
