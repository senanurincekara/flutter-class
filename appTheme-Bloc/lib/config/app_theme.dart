import 'package:flutter/material.dart';

class CustomAppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(221, 105, 10, 10),
        ),
      );

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 180, 15, 119),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 55, 1, 38),
            fontSize: 22,
          ),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 243, 164, 190),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color.fromARGB(221, 173, 11, 159),
        ),
      );
}
