import 'package:flutter/material.dart';

// Define a separate class for your custom calendar theme
class CalendarTheme {
  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: Colors.blueAccent, // Override the default purple to teal (or any color you like)
        secondary: Colors.blueAccent, // Accent color for buttons or highlights
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueAccent,  // Customize button color
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
