import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF000000),
    primaryContainer: Color(0xFF262B34),
    primary: Color(0xFF808080),
    secondary: Color.fromRGBO(43, 43, 43, 1),
    tertiary: Color.fromRGBO(117, 117, 117, 1),
    inversePrimary: Color(0xFFFFFFFF),
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: const Color.fromRGBO(255, 255, 255, 1),
    displayColor: const Color.fromRGBO(255, 255, 255, 1),
  ),
);
