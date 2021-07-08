import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.lightGreenAccent,
      scaffoldBackgroundColor: Colors.lightGreenAccent,
      accentColor: Colors.green,
      appBarTheme: AppBarTheme(color: Colors.greenAccent),
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)),
      buttonTheme: ButtonThemeData(buttonColor: Colors.white),
      visualDensity: VisualDensity.adaptivePlatformDensity);
  final darkTheme = ThemeData.dark();
}
