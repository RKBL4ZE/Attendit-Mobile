import 'package:Attendit/loaders/color_loader_4.dart';
import 'package:flutter/material.dart';

class Styles {
  static const buttonTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static const chartLabelsTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );

  static const tabTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static const colorGradientTheme = LinearGradient(colors: [
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(255, 255, 255, 1)
  ]);

  static const headingfontcolor = Colors.black;

  static const colorshadow = Color.fromRGBO(247, 145, 86, 1);
  static const colorPrimary = Color.fromRGBO(247, 145, 86, 1);
  static const colorSecondary = Colors.black;

  static const divider = Divider(
    color: Color.fromRGBO(245, 102, 116, 1),
    height: 10,
    thickness: 2,
    indent: 20,
    endIndent: 10,
  );
}

class NavbarStyle {
  static final active = Colors.blueGrey[900];
  static const inactive = Colors.grey;
}

class PrimaryStyle {
  static final primary = Colors.blueGrey[900];
  static const accent = Colors.grey;
  static const splash = Colors.blue;
  static const graph = Colors.cyan;
}

class GraphStyle {
  static final text = Colors.blueGrey[900];
  static final primary = Colors.blueGrey[900];
  static final low = Colors.red;
  static final lowAccent = Colors.red[100];
  static final mid = Colors.lightBlue;
  static final midAccent = Colors.lightBlue[100];
  static final high = Colors.green;
  static final highAccent = Colors.lightGreen[100];
}

class CardStyle {
  static final text = Colors.blueGrey[900];
  static final primary = Colors.blueGrey[900];
  static final headingStyle = TextStyle(
    // fontFamily: 'Rubik',
    fontSize: 20,
    color: CardStyle.text,
    fontWeight: FontWeight.bold,
    //  fontWeight: FontWeight.bold
  );
  static final subHeadingStyle = TextStyle(
    fontSize: 15,
    color: Colors.blueGrey[800],
  );
  static final textStyle = TextStyle(
    fontSize: 15,
    color: Color.fromRGBO(128, 139, 151, 1),
  );

  static final boxShadow = BoxShadow(
    color: Colors.grey.withAlpha(10),
    blurRadius: 0.2,
    spreadRadius: 0.5,
    /*   offset: Offset(
      0.0,
      1.0,
    ), */
  );
}

Widget loaderWidget=ColorLoader4();
