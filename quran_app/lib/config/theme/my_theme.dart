import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/colors_manager.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
        color: Color(0xff242424),
      ),
    ),
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
        )),
    dividerColor: ColorsManager.goldColor,
  );
}
