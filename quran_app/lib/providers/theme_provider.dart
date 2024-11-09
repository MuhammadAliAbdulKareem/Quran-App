// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ThemeProvider extends ChangeNotifier with WidgetsBindingObserver {
//   ThemeMode currentTheme = ThemeMode.system;

//   ThemeProvider() {
//     WidgetsBinding.instance.addObserver(this);
//     saveCurrentTheme(currentTheme);
//     getCurrentTheme();
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   void changeAppTheme(ThemeMode newTheme) {
//     if (newTheme == currentTheme) return;
//     currentTheme = newTheme;
//     saveCurrentTheme(currentTheme);
//     notifyListeners();
//   }

//   bool isLight() => currentTheme == ThemeMode.light;

//   bool isDark() => currentTheme == ThemeMode.dark;

//   void saveCurrentTheme(ThemeMode theme) async {
//     SharedPreferences themePref = await SharedPreferences.getInstance();

//     theme == ThemeMode.light
//         ? themePref.setString('theme', 'light')
//         : themePref.setString('theme', 'dark');
//   }

//   void getCurrentTheme() async {
//     SharedPreferences themePref = await SharedPreferences.getInstance();
//     String theme = themePref.getString('theme') ?? 'light';
//     currentTheme = theme == 'light' ? ThemeMode.light : ThemeMode.dark;
//     notifyListeners();
//   }

//   @override
//   void didChangePlatformBrightness() {
//     if (currentTheme == ThemeMode.system) {
//       Brightness brightness =
//           WidgetsBinding.instance.platformDispatcher.platformBrightness;
//       currentTheme =
//           brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
//       notifyListeners();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier with WidgetsBindingObserver {
  ThemeMode currentTheme = ThemeMode.system;

  ThemeProvider() {
    WidgetsBinding.instance.addObserver(this);
    getCurrentTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void changeAppTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    saveCurrentTheme(currentTheme);
    notifyListeners();
  }

  bool isLight() => currentTheme == ThemeMode.light;
  bool isDark() => currentTheme == ThemeMode.dark;

  Future<void> saveCurrentTheme(ThemeMode theme) async {
    SharedPreferences themePref = await SharedPreferences.getInstance();
    await themePref.setString(
      'theme',
      theme == ThemeMode.light
          ? 'light'
          : theme == ThemeMode.dark
              ? 'dark'
              : 'system',
    );
  }

  Future<void> getCurrentTheme() async {
    SharedPreferences themePref = await SharedPreferences.getInstance();
    String theme = themePref.getString('theme') ?? 'system';

    if (theme == 'system') {
      Brightness brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      currentTheme =
          brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    } else {
      currentTheme = theme == 'light' ? ThemeMode.light : ThemeMode.dark;
    }

    notifyListeners();
  }

  @override
  void didChangePlatformBrightness() {
    if (currentTheme == ThemeMode.system) {
      Brightness brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      currentTheme =
          brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }
}
