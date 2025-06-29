import 'package:flutter/material.dart';

import '../utils/constraints.dart';
import '../utils/utils.dart';

class MyTheme {
  static final borderRadius = BorderRadius.circular(4.0);
  static final theme = ThemeData(
      //brightness: Brightness.light,
      primaryColor: whiteColor,
      scaffoldBackgroundColor: scaffoldBgColor,
      // bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),
      // colorScheme: const ColorScheme.light(secondary: lightningYellowColor),
      appBarTheme: const AppBarTheme(
        backgroundColor: blackColor,
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        titleTextStyle: TextStyle(color: whiteColor, fontSize: 20.0, fontWeight: FontWeight.w700),
        iconTheme: IconThemeData(color: whiteColor),
        elevation: 0,
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 12, height: 1.83, fontFamily: 'HelveticaNeueMedium',),
        bodyLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          height: 1.0,
          color: whiteColor,
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
        elevation: 0,
        backgroundColor: blackColor,
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
        selectedItemColor: whiteColor,
        unselectedItemColor: grayColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          color: grayColor,
          fontFamily: 'HelveticaNeueMedium',
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          color: hintTextColor,
          fontFamily: 'HelveticaNeueMedium',
        ),
       // prefixIconConstraints:  const BoxConstraints(maxWidth: 100.0),
        contentPadding: Utils.symmetric(h: 20.0,v: 14.0),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: whiteColor.withValues(alpha: 0.24),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: whiteColor.withValues(alpha: 0.24),
          ),
        ),
        focusColor: primaryColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: whiteColor,
        selectionColor: primaryColor,
        selectionHandleColor: primaryColor,
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: primaryColor));
}
