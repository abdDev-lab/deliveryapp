// ignore_for_file: file_names

import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "Poppins",
    textTheme: TextTheme(
      headlineLarge: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black),
      headlineMedium: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
      titleLarge: const TextStyle(color: Colors.black, fontSize: 26),
      titleMedium: const TextStyle(color: Colors.black, fontSize: 21),
      displaySmall: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
      labelLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        letterSpacing: 0.5,
      ),
      labelMedium: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
      bodySmall: TextStyle(color: Colors.grey[600]),
      bodyMedium: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
    ));
ThemeData themeArabic = ThemeData(
    fontFamily: "Cairo",
    textTheme: TextTheme(
      headlineLarge: const TextStyle(
          fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black),
      headlineMedium: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
      titleLarge: const TextStyle(color: Colors.black, fontSize: 26),
      titleMedium: const TextStyle(color: Colors.black, fontSize: 21),
      displaySmall: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
      labelLarge: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
      labelMedium: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
      bodySmall: TextStyle(color: Colors.grey[600]),
      bodyMedium: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
    ));

ThemeData darkThemArabic = ThemeData(
    fontFamily: "Cairo",
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.grey[900]!,
      secondary: Colors.grey[800]!,
    ));
ThemeData darkThem = ThemeData(
    fontFamily: "Poppins",
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.grey[900]!,
      secondary: Colors.grey[800]!,
    ));
ThemeData lightThemArabic = ThemeData(
  fontFamily: "Cairo",
  iconTheme: const IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    secondary: AppColor.secColor4,
  ),
);
ThemeData lightThem = ThemeData(
  fontFamily: "Poppins",
  iconTheme: const IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    secondary: AppColor.secColor4,
  ),
);
