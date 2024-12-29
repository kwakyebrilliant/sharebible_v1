import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFF7F7FA),
    primaryContainer: Color(0xFFFFFFFF),
    primary: Color(0xFF808080),
    secondary: Color.fromRGBO(233, 233, 240, 1),
    tertiary: Color.fromRGBO(233, 233, 233, 1),
    inversePrimary: Color(0xFF000000),
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: const Color.fromRGBO(0, 0, 0, 1),
    displayColor: const Color.fromRGBO(0, 0, 0, 1),
  ),
);
