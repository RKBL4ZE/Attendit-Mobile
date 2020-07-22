import 'package:flutter/material.dart';
import 'package:koukicons/about.dart';
import 'package:koukicons/assistant.dart';
import 'package:koukicons/compose.dart';
import 'package:koukicons/favourite2.dart';
import 'package:koukicons/graduationCap.dart';
import 'package:koukicons/note.dart';

class IconsService {
  static const double height = 27;
  static const double width = 27;
  static final onlineClasses = KoukiconsCompose(
    height: height,
    width: width,
  );
  //static final internalMarks = ;
  static final exteralMarks = KoukiconsGraduationCap(
    height: height,
    width: width,
  );
  static final assignment = KoukiconsNote(
    height: height,
    width: width,
  );
  static final contactUs = KoukiconsAssistant(
    height: height,
    width: width,
  );
  static final aboutUs = KoukiconsAbout(
    height: height,
    width: width,
  );

  static final rank1 = KoukiconsFavourite2(
      height: height, width: width, color: Color.fromRGBO(255, 215, 0, 1));
  static final rank2 = KoukiconsFavourite2(
    height: height,
    width: width,
    color: Color.fromRGBO(192, 192, 192, 1),
  );
  static final rank3 = KoukiconsFavourite2(
    height: height,
    width: width,
    color: Color.fromRGBO(205, 127, 50, 1),
  );
}
