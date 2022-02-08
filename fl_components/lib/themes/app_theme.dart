import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      // Primary color
      primaryColor: primary,

      // Appbar Theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),

      // TextButton Theme
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),

      // FloatingACtionButton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 5),

      // ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: primary, shape: const StadiumBorder(), elevation: 0),
      ));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primary,
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
}
