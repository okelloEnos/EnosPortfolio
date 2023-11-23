import 'package:flutter/material.dart';

import 'custom_colors.dart';

class AppTheme{

  static ThemeData lightTheme(){
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: CustomColors.primary,
      primary: CustomColors.primary,
      secondary: CustomColors.primary,
        tertiary: CustomColors.primary
      ),
      textTheme: AppTextTheme.lightTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: CustomColors.primary,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: CustomColors.primary,
        ),
      ),
      useMaterial3: true,
    );
  }

  // static ThemeData darkTheme(){
  //   return ThemeData(
  //     colorScheme: ColorScheme.fromSeed(
  //       brightness: Brightness.dark,
  //         seedColor: colorGreen,
  //         primary: colorGreen,
  //         secondary: colorAccent,
  //         tertiary: colorPrimaryDark
  //     ),
  //     textTheme: AppTextTheme.darkTextTheme(),
  //     useMaterial3: true,
  //   );
  // }
}

class AppTextTheme{
  static TextTheme lightTextTheme(){
    return const TextTheme(
      bodySmall: TextStyle(
        color: Colors.black38,
        fontFamily: 'Montserrat',
        fontSize: 12,
        fontWeight: FontWeight.w400
      ),
      displayLarge: TextStyle(
        color: CustomColors.primary,
        fontFamily: 'Montserrat',
        fontSize: 25,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w700
      ),
      displayMedium: TextStyle(
          color: CustomColors.primary,
          fontFamily: 'Montserrat',
          fontSize: 18,
          fontWeight: FontWeight.w400
      ),
      displaySmall: TextStyle(
          color: CustomColors.primary,
          fontFamily: 'Montserrat',
          fontSize: 10,
          fontWeight: FontWeight.normal
      ),
      labelMedium: TextStyle(
          color: CustomColors.primary,
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400
      ),
      labelSmall: TextStyle(
          color: CustomColors.primary,
          fontFamily: 'Montserrat',
          fontSize: 10,
          fontWeight: FontWeight.bold
      ),
      titleMedium: TextStyle(
          color: CustomColors.primary,
          fontFamily: 'Montserrat',
          fontSize: 18,
          fontWeight: FontWeight.w400
      ),
      bodyMedium: TextStyle(
          color: CustomColors.primary,
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400
      ),

    );
  }

  static TextTheme darkTextTheme(){
    return const TextTheme();
  }
}