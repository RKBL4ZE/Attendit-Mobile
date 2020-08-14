import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme { Light, Dark }

final appThemeData = {
  AppTheme.Light: ThemeData.light().copyWith(
    primaryColor: Color.fromRGBO(68, 61, 246, 1),
    textTheme: GoogleFonts.openSansTextTheme(),
    primaryColorBrightness: Brightness.light,
  )
};
