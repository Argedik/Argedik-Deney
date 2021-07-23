import 'package:argedik/Core/Colors.dart';
import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.lightGreenAccent,
      scaffoldBackgroundColor: Colors.lightGreenAccent,
      accentColor: Colors.green,
      appBarTheme: AppBarTheme(color: Colors.greenAccent),
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white, fontSize: 12),
          headline3: TextStyle(color: Colors.white, fontSize: 12),
          overline: TextStyle(fontSize: 12)),
      buttonTheme: ButtonThemeData(buttonColor: Colors.black),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0)))),
      visualDensity: VisualDensity.adaptivePlatformDensity);
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: bg2Color,
  );
}
