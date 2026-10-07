import 'package:flutter/material.dart';

import 'app_palette.dart';

class AppTheme {
  static final lightPalette = AppPalette(
    themeColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    onSurfaceColor: Colors.grey,
    onSurfaceLightColor: Colors.grey.shade400,
    onSurfaceDarkColor: Colors.grey.shade600,
    successColor: Colors.green,
    successColorLight: Colors.green.shade50,
    successColorDark: Colors.green.shade700,
    errorColor: Colors.red,
    errorColorLight: Colors.red.shade100,
    errorColorDark: Colors.red.shade800
  );


  static final lightThemeMode = ThemeData(
    primaryColor: lightPalette.themeColor,
    scaffoldBackgroundColor: lightPalette.scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: lightPalette.themeColor,
      foregroundColor: lightPalette.scaffoldBackgroundColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: .bold,
        letterSpacing: 8,
        color: lightPalette.scaffoldBackgroundColor
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      iconSize: 35
    ),

    colorScheme: ColorScheme.light(
      primary: lightPalette.themeColor,
      onPrimary: lightPalette.scaffoldBackgroundColor,
      onSurface: lightPalette.onSurfaceColor
    ),

    textTheme: TextTheme(

      titleSmall: TextStyle(
        fontSize: 14,
        color: lightPalette.onSurfaceLightColor,
        fontWeight: FontWeight.w400
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: lightPalette.onSurfaceDarkColor,
        fontWeight: FontWeight.w400
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: lightPalette.onSurfaceLightColor,
        fontWeight: FontWeight.bold
      ),


      bodySmall: TextStyle(
          fontSize: 12,
          color: lightPalette.onSurfaceLightColor
      ),
      bodyMedium: TextStyle(
          fontSize: 14,
          color: lightPalette.onSurfaceColor
      ),
      bodyLarge: TextStyle(
          fontSize: 16,
          color: lightPalette.onSurfaceLightColor
      ),


      labelSmall: TextStyle(
          fontSize: 14,
          color: lightPalette.onSurfaceColor
      ),
      labelMedium: TextStyle(
          fontSize: 16,
          color: lightPalette.onSurfaceColor
      ),
      labelLarge: TextStyle(
          fontSize: 20,
          color: lightPalette.onSurfaceColor
      ),

      headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: lightPalette.onSurfaceColor
      ),
      headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: lightPalette.onSurfaceColor
      ),
      headlineLarge: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: lightPalette.onSurfaceColor
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: .circular(10)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightPalette.onSurfaceColor),
          borderRadius: .circular(10)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightPalette.themeColor, width: 2),
          borderRadius: .circular(10)
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightPalette.errorColorDark, width: 2),
          borderRadius: .circular(10)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightPalette.errorColorDark, width: 2),
          borderRadius: .circular(10)
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightPalette.themeColor,
        foregroundColor: lightPalette.scaffoldBackgroundColor,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: .all(lightPalette.themeColor),
        backgroundColor: .all(Colors.transparent),
      ),
    ),

    dividerTheme: DividerThemeData(
      color: lightPalette.onSurfaceLightColor,
    ),

    datePickerTheme: DatePickerThemeData(
      dividerColor: lightPalette.onSurfaceColor,
    ),

    timePickerTheme: TimePickerThemeData(
        dialHandColor: lightPalette.onSurfaceColor,
        dialTextColor: lightPalette.onSurfaceColor,
        hourMinuteTextColor: lightPalette.onSurfaceColor,
        hourMinuteColor: lightPalette.scaffoldBackgroundColor,
        helpTextStyle: TextStyle(
          fontSize: 17,
          color: lightPalette.onSurfaceDarkColor,
          fontWeight: FontWeight.w400
        ),
    ),


    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: .all(BorderSide(color: lightPalette.themeColor, width: 2))
      )
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: .all(lightPalette.themeColor),
        foregroundColor: .all(lightPalette.scaffoldBackgroundColor),
      )
    ),

    iconTheme: IconThemeData(
      color: lightPalette.onSurfaceColor
    ),

    extensions: <ThemeExtension<AppPalette>>[
      lightPalette
    ]
  );
}
