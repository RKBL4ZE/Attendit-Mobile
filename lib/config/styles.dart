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
            Color.fromRGBO(247, 145, 86, 1),
            Color.fromRGBO(245, 102, 116, 1)
          ]);

static const headingfontcolor = Colors.black;

static const colorshadow = Color.fromRGBO(247, 145, 86, 1);


static const divider = Divider(
            color: Color.fromRGBO(245, 102, 116, 1),
            height: 10,
            thickness: 2,
            indent: 20,
            endIndent: 10,
          );

}
