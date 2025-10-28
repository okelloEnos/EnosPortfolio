import 'package:flutter/material.dart';

import 'custom_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: CustomColors.primary,
            primary: CustomColors.primary,
            onPrimary: CustomColors.white,
            secondary: CustomColors.secondary,
            onSecondary: CustomColors.white,
            tertiary: CustomColors.black,
            onTertiary: CustomColors.white,
            surface: CustomColors.brightBackground,
            surfaceTint: CustomColors.darkBackground,
            onSurface: CustomColors.white
        ),
        textTheme: AppTextTheme.lightTextTheme(),
        useMaterial3: true,
        fontFamily: "Manrope");
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

class AppTextTheme {
  static TextTheme lightTextTheme() {
    return const TextTheme(
      displaySmall: TextStyle(
        color: CustomColors.primary,
        fontFamily: 'Manrope',
        fontSize: 10,
        fontWeight: FontWeight.normal,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      displayMedium: TextStyle(
        color: CustomColors.primary,
        fontFamily: 'Manrope',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 48,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w700,
        height: 1.6,
        // letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        color: CustomColors.primary,
        fontFamily: 'Manrope',
        fontSize: 10,
        fontWeight: FontWeight.bold,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      titleSmall: TextStyle(
        color: CustomColors.primary,
        fontFamily: 'Manrope',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      titleMedium: TextStyle(
        color: CustomColors.primary,
        fontFamily: 'Manrope',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      titleLarge: TextStyle(
        color: CustomColors.primary,
        fontFamily: 'Manrope',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0.5,
      ),
    );
  }

  static TextTheme darkTextTheme() {
    return const TextTheme();
  }
}
