import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 255, 255, 255),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: const Color.fromARGB(255, 249, 184, 246),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.black87, fontSize: 20.0),
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 16.0),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: const Color.fromARGB(255, 208, 226, 242),
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 43, 0, 21),
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      color: const Color.fromARGB(255, 44, 0, 33),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20.0),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 16.0),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: const Color.fromARGB(255, 15, 1, 12),
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: ColorScheme.dark(
      primary: const Color.fromARGB(255, 111, 5, 150),
      onPrimary: Colors.white,
      secondary: const Color.fromARGB(255, 83, 2, 115),
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.grey[800]!,
      onSurface: Colors.white,
    ),
  );
}
