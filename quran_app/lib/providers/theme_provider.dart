import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeAppTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    saveCurrentTheme(currentTheme);
    notifyListeners();
  }

  bool isLight() {
    return currentTheme == ThemeMode.light;
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  void saveCurrentTheme(ThemeMode theme) async {
    SharedPreferences themePref = await SharedPreferences.getInstance();

    theme == ThemeMode.light
        ? themePref.setString('theme', 'light')
        : themePref.setString('theme', 'dark');
  }

  void getCurrentTheme() async {
    SharedPreferences themePref = await SharedPreferences.getInstance();
    String theme = themePref.getString('theme') ?? 'light';
    currentTheme = theme == 'light' ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
