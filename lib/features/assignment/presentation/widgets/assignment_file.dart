import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AssignmentFile extends StatelessWidget {
  final String file;
  final String fileName;

  const AssignmentFile({Key key, @required this.file, this.fileName = "File"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String fileextension = file.split(".")[file.split(".").length - 1];
    Widget fileicon() {
      if (fileextension == "pdf") {
        return Icon(
          Icons.picture_as_pdf,
          color: Colors.red,
          //color: Color.fromRGBO(128, 139, 151, 1),
          size: 20.0,
        );
      } else {
        return Icon(
          Icons.filter_frames,
          color: Colors.red,
          //color: Color.fromRGBO(128, 139, 151, 1),
          size: 20.0,
        );
      }
    }

    return ListTile(
      contentPadding: EdgeInsets.all(0),
      dense: true,
      onTap: () async {
        String url = file;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      leading: fileicon(),
      trailing: Icon(
        Icons.file_download,
        //color: Colors.red,
        //color: Color.fromRGBO(128, 139, 151, 1),
        size: 20.0,
      ),
      title: AutoSizeText(fileName,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'Rubik',
              color: Color.fromRGBO(128, 139, 151, 1),
              fontWeight: FontWeight.bold)),
    );
  }
}
