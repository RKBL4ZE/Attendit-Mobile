import 'dart:io';

import 'package:Attendit/config/styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AssignmentFilePicker extends StatefulWidget {
  final Function setUserFile;

  const AssignmentFilePicker(this.setUserFile);

  @override
  _AssignmentFilePickerState createState() => _AssignmentFilePickerState();
}

bool isFileSelected = false;
String filePath;
File file;

class _AssignmentFilePickerState extends State<AssignmentFilePicker> {
  @override
  Widget build(BuildContext context) {
    Future<void> filepicker() async {
      // operations to be performed
      // end of operations to be performed
      filePath = await FilePicker.getFilePath(type: FileType.any);
      setState(() {
        print(filePath);
        file = File('$filePath');
        widget.setUserFile(file);
        print(file);
        if (filePath != null) {
          isFileSelected = true;
        }
      });
    }

    return isFileSelected == false
        ? Container(
            margin: EdgeInsets.fromLTRB(0, 14, 0, 14),
            alignment: Alignment.bottomCenter,
            height: 40.0,
            child: OutlineButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),

              // textColor: Colors.blue,
              child: SizedBox.expand(
                child: Center(
                  child: Text('Add Attachments',
                      style: TextStyle(
                        color: AssignmentStyle.txtHeadingColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              borderSide: BorderSide(
                  color: AssignmentStyle.txtHeadingColor,
                  style: BorderStyle.solid,
                  width: 1.5),

              onPressed: () {
                filepicker();
                //widget.setUserFile(null);
              },
            ))
        : ListTile(
            title: Text(filePath.split("/")[filePath.split("/").length - 1]),
            trailing: InkWell(
              onTap: () {
                setState(() {
                  isFileSelected = false;
                });
              },
              child: Icon(
                Icons.delete,
                //color: Colors.red,
                //color: Color.fromRGBO(128, 139, 151, 1),
                size: 20.0,
              ),
            ),
          );
  }
}
