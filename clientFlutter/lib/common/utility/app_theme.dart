import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

class AppColors {
  static const Color primary = Colors.blueAccent;
  static const Color secondary = Colors.orangeAccent;
  static const Color textOnPrimary = Colors.white;
  static const Color background = Color(0xFFF5F5F5);

}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.background,
      ),
      scaffoldBackgroundColor: AppColors.background,

      appBarTheme: AppBarTheme(
       // backgroundColor: AppColors.primary,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
        labelStyle: TextStyle(color: Colors.grey[700]),
        floatingLabelStyle: TextStyle(color: AppColors.primary),
      ),
      searchBarTheme:
        SearchBarThemeData(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          elevation: WidgetStateProperty.all(1),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          )
        ),),




      // Add more component themes here
    );
  }
}
