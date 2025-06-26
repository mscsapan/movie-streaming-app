import 'package:flutter/material.dart';

import '../utils/constraints.dart';
import '../utils/utils.dart';

class MyTheme {
  static final borderRadius = BorderRadius.circular(10.0);
  static final theme = ThemeData(
      //brightness: Brightness.light,
      primaryColor: whiteColor,
      scaffoldBackgroundColor: scaffoldBgColor,
      // bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),
      // colorScheme: const ColorScheme.light(secondary: lightningYellowColor),
      appBarTheme: const AppBarTheme(
        backgroundColor: grayBackgroundColor,
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        titleTextStyle: TextStyle(
            color: blackColor, fontSize: 20.0, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: blackColor),
        elevation: 0,
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 12, height: 1.83, fontFamily: 'HelveticaNeueMedium',),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.375,
          fontFamily: 'HelveticaNeueMedium',),
        bodyMedium: TextStyle(
          fontSize: 14, height: 1.5714, fontFamily: 'HelveticaNeueMedium',),
        labelLarge: TextStyle(
          fontSize: 16,
          height: 2,
          fontWeight: FontWeight.w600,
          fontFamily: 'HelveticaNeueMedium',),
        titleLarge: TextStyle(fontSize: 16,
          height: 2,
          fontWeight: FontWeight.w600,
          fontFamily: 'HelveticaNeueMedium',),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 64),
          backgroundColor: whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
            shadowColor: WidgetStatePropertyAll(transparent),
            elevation: WidgetStatePropertyAll(0.0),
            iconSize: WidgetStatePropertyAll(20.0),
            splashFactory: NoSplash.splashFactory,
            overlayColor: WidgetStatePropertyAll(
              (transparent),
            ),
            padding: WidgetStatePropertyAll(EdgeInsets.zero)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 3,
        backgroundColor: whiteColor,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: primaryColor,
          fontSize: 14.0,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: grayColor,
          fontSize: 14.0,
          fontFamily: 'HelveticaNeueMedium',
        ),
        selectedItemColor: primaryColor,
        unselectedItemColor: grayColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          color: grayColor,
          fontFamily: 'HelveticaNeueMedium',
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          color: hintTextColor,
          fontFamily: 'HelveticaNeueMedium',
        ),
        contentPadding: Utils.symmetric(v: 20.0),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
        fillColor: whiteColor,
        //fillColor: fillColor,
        filled: true,
        focusColor: primaryColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: blackColor,
        selectionColor: blackColor,
        selectionHandleColor: blackColor,
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: primaryColor));
}
