import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color blackColor =Colors.black ;
  static const Color whiteColor = Colors.white;
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor:primaryColor ,
    dividerTheme: DividerThemeData(
      color: primaryColor,
      thickness: 3,
    ),

    textTheme: TextTheme(
      titleSmall:GoogleFonts.inter(
        fontSize: 25,
        letterSpacing: .5,
        fontWeight: FontWeight.w500,
        color: whiteColor,
      ) ,
      bodySmall: GoogleFonts.inter(
        fontSize: 25,
        letterSpacing: .5,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),

    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: primaryColor,
      unselectedItemColor: whiteColor,
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
