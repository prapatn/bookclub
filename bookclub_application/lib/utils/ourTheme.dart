// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OurTheme {
  final Color _lightGreen = const Color.fromARGB(255, 213, 235, 220);
  final Color _lightGrey = const Color.fromARGB(255, 164, 164, 164);
  final Color _darkGrey = const Color.fromARGB(255, 119, 124, 125);
  ThemeData buildTheme() {
    return ThemeData(
        canvasColor: _lightGreen,
        primaryColor: _lightGreen,
        accentColor: _lightGrey,
        secondaryHeaderColor: _darkGrey,
        highlightColor: _lightGrey,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: _lightGrey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: _lightGreen)),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: _darkGrey,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            minWidth: 200,
            height: 40.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )));
  }
}
