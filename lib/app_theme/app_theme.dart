import 'package:flutter/material.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';

ThemeData darkTheme = ThemeData(
    hintColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: AppColors.black10,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ));

class CustomColorTheme extends ColorScheme {
  CustomColorTheme(
      {required super.brightness,
      required super.primary,
      required super.onPrimary,
      required super.secondary,
      required super.onSecondary,
      required super.error,
      required super.onError,
      required super.background,
      required super.onBackground,
      required super.surface,
      required super.onSurface});
}

ThemeData lightTheme = ThemeData(
    hintColor: Colors.pink,
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));
