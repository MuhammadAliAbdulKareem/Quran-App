import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/core/colors_manager.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsManager.goldColor,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 30.0,
          fontWeight: FontWeight.w700,
          color: const Color(0xff242424),
        )),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.goldColor,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(
        size: 28.0,
      ),
      unselectedIconTheme: IconThemeData(
        size: 24.0,
      ),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      elevation: 12.0,
      backgroundColor: ColorsManager.goldColor,
    ),
    textTheme: TextTheme(
      labelMedium: GoogleFonts.elMessiri(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: const Color(0xff242424),
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: const Color(0xff242424),
      ),
      headlineMedium: GoogleFonts.elMessiri(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: GoogleFonts.elMessiri(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
      displayLarge: GoogleFonts.elMessiri(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
      ),
    ),
    dividerColor: ColorsManager.goldColor,
  );
}
