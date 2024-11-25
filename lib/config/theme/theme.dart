import 'package:flutter/material.dart';

class ThemeApp {
  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xff6C48C5),
    scaffoldBackgroundColor: Color(0xffC68FE6),
    appBarTheme: AppBarTheme(color: Color(0xff1230AE),),
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),

  );

  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Color(0xffA3EAFF)),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),

  );
}