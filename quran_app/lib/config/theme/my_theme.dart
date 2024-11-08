import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/core/colors_manager.dart';

class MyTheme {
  static bool isDark = false;
  static ThemeData light = ThemeData(
    primaryColor: ColorsManager.primaryLight,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 30.0,
          fontWeight: FontWeight.w700,
          color: const Color(0xff242424),
        )),
    scaffoldBackgroundColor: Colors.transparent,
    // canvasColor: ColorsManager
    //     .primaryLight, // To Change the Color Of the Bottom Navigation Bar when the Change the type of it to any other value than fixed
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.primaryLight,
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
      backgroundColor: ColorsManager.primaryLight,
    ),
    cardTheme: CardTheme(
      margin: const EdgeInsets.all(16.0),
      color: ColorsManager.primaryLight.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
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
    dividerColor: ColorsManager.primaryLight,
  );
  static ThemeData dark = ThemeData(
    primaryColor: ColorsManager.primaryDark,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 30.0,
          fontWeight: FontWeight.w700,
          color: ColorsManager.white,
        ),
        iconTheme: const IconThemeData(
          color: ColorsManager.white,
        )),
    scaffoldBackgroundColor: Colors.transparent,
    // canvasColor: ColorsManager
    //     .primaryDark, // To Change the Color Of the Bottom Navigation Bar when the Change the type of it to any other value than fixed
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.primaryDark,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: ColorsManager.yellow,
      selectedIconTheme: IconThemeData(
        size: 28.0,
      ),
      unselectedIconTheme: IconThemeData(
        size: 24.0,
      ),
      unselectedItemColor: ColorsManager.white,
      showUnselectedLabels: false,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      elevation: 12.0,
      backgroundColor: ColorsManager.primaryDark,
    ),
    cardTheme: CardTheme(
      margin: const EdgeInsets.all(16.0),
      color: ColorsManager.primaryDark.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
    ),
    textTheme: TextTheme(
      labelMedium: GoogleFonts.elMessiri(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: ColorsManager.white,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white,
      ),
      headlineMedium: GoogleFonts.elMessiri(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: ColorsManager.yellow,
      ),
      headlineSmall: GoogleFonts.elMessiri(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      displayLarge: GoogleFonts.elMessiri(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: ColorsManager.yellow,
      ),
    ),
    dividerColor: ColorsManager.yellow,
  );
}
