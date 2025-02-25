import 'package:flutter/material.dart';

class ThemeApp {
  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xffc157e1),
    scaffoldBackgroundColor: const Color(0xff190520),
    appBarTheme: const AppBarTheme(
      color: Color(0xffc157e1),
      elevation: 2,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xffc157e1),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.white,
      ),
      bodySmall: TextStyle(
          color: Colors.white,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
          color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xffc157e1),
      onPrimary: Colors.white, // Màu chữ trên ElevatedButton
      secondary: Colors.white,
    ),
  );

  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xffF9F9FB),
    appBarTheme: const AppBarTheme(
      color: Color(0xffA3EAFF),
      elevation: 2,
      iconTheme: IconThemeData(color: Colors.blue),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xffA3EAFF),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Color(0xff3A3A3A),
      ),
      bodySmall: TextStyle(
        color: Color(0xff195c71),
      ),
      titleSmall: TextStyle(
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
          color: Colors.black,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xffA3EAFF),
      onPrimary: Colors.black,
      secondary: Color(0xff40b4d6),
    ),
  );

}
