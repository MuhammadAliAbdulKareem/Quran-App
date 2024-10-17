import 'package:flutter/material.dart';

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
          size: 32.0,
        ),
        unselectedIconTheme: IconThemeData(
          size: 28.0,
        ),
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
      ));
}
