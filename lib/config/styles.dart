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
  static const padding = EdgeInsets.all(7);
}

class GraphStyle {
  static final text = Colors.blueGrey[900];
  static final primary = Colors.blueGrey[900];
  static final low = Colors.red[400];
  static final lowAccent = Colors.red[50];
  static final mid = Colors.lightBlue;
  static final midAccent = Colors.lightBlue[100];
  static final high = Colors.green;
  static final highAccent = Colors.lightGreen[100];
  static final linearGradient = LinearGradient(colors: [
    Color.fromRGBO(247, 145, 86, 1),
    Color.fromRGBO(245, 102, 116, 1)
  ]);
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
    color: Colors.black87,
  );

  static final boxShadow = BoxShadow(
    color: Colors.grey.withAlpha(10),
    blurRadius: 0.2,
    spreadRadius: 0.5,
  );

  static final overflow = TextOverflow.ellipsis;

  static const int maxLines = 1;

  static const double minFontSize = 14;

  static const double maxFontSize = 14;

  static final tablecolumnWidths = {
    0: FlexColumnWidth(4),
    1: FlexColumnWidth(4),
    2: FlexColumnWidth(2),
  };
}

class NewsFeedCardStyle {
  static const double profileImageHeight = 30;
  static const double profileImageWidth = 30;
  static const profileImageFit = BoxFit.cover;
  static const profileMargin = EdgeInsets.fromLTRB(7, 7, 7, 7);
  static const profileTextStyle =
      TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400);
  static const titleTextStyle =
      TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600);
  static const titleMargin = EdgeInsets.fromLTRB(0, 7, 0, 0);
  static const textStyle = TextStyle(
    fontSize: 14,
    color: Color.fromRGBO(29, 53, 84, 1),
  );
  static const textMargin = EdgeInsets.fromLTRB(20, 10, 15, 10);
}

class LectureCardStyle {
  static final boxShadow = CardStyle.boxShadow;
  static final beforeColor = Colors.blueGrey[800];
  static final currentColor = Colors.green;
  static final afterColor = Colors.blue[700];
  static final buttonColor = Colors.blueGrey[800];
  static final textStyle =
      TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);
  static final headingTextStyle =
      TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);
  static final subHeadingTextStyle =
      TextStyle(fontSize: 16, color: Colors.white);
  static final shape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
}

Widget loaderWidget = ColorLoader4();
Color fulltimeTablePrimaryColor = Colors.green[50];

class ResultCardStyle {
  static final subbarColor = Colors.white54;
  static final subbarSelectedColor = Colors.grey;
  static final percentageBarColor = Colors.blueGrey[900];
  static final selectedColor = Colors.grey[300];
  static final subheadingColor = Colors.grey[700];
  static final headingTextStyle = TextStyle(
      fontSize: 31, color: Colors.grey[850], fontWeight: FontWeight.w800);
  static final boxShadow = CardStyle.boxShadow;
}

class AssignmentStyle {
  static final txtHeadingColor = Color.fromRGBO(29, 53, 84, 0.9);
  static final fileHeadingColor = Color.fromRGBO(128, 139, 151, 1);
}
