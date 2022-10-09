import 'package:flutter/material.dart';
import 'package:task1/theme/custom_colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: lightPrimaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.grey,
      ),
      scaffoldBackgroundColor: lightBackgroundColor,

      fontFamily: 'Montserrat',
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        textStyle: const TextStyle(
            color: Colors.deepOrange,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      )),
      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), backgroundColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)), // background color
              textStyle:
                  const TextStyle(fontSize: 30, fontStyle: FontStyle.italic))),
      // outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        textStyle: const TextStyle(
          fontSize: 20,
        ),
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrangeAccent,
      )
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: darkPrimaryColor,
      scaffoldBackgroundColor: darkBackgroundColor,
      fontFamily: 'Montserrat',
      textTheme: ThemeData.dark().textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepOrangeAccent,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        textStyle: const TextStyle(
            color: Colors.deepOrange,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      )),
      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)), // background color
              textStyle:
                  const TextStyle(fontSize: 30, fontStyle: FontStyle.italic))),
      // outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        textStyle: const TextStyle(
          fontSize: 30,
        ),
      )),
    );
  }
}
