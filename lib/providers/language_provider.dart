import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale currentLanguage = const Locale('en');

  void changeAppLanguage(Locale newLanguage) {
    if (newLanguage == currentLanguage) return;
    currentLanguage = newLanguage;
    saveCurrentLanguage(currentLanguage);
    notifyListeners();
  }

  bool isEnglish() {
    return currentLanguage == const Locale('en');
  }

  bool isArabic() {
    return currentLanguage == const Locale('ar');
  }

  void saveCurrentLanguage(Locale language) async {
    SharedPreferences languagePref = await SharedPreferences.getInstance();
    language == const Locale('en')
        ? languagePref.setString('language', 'english')
        : languagePref.setString('language', "arabic");
  }

  void getCurrentLanguage() async {
    SharedPreferences languagePref = await SharedPreferences.getInstance();
    String language = languagePref.getString("language") ?? "english";
    currentLanguage =
        language == "english" ? const Locale("en") : const Locale("ar");
  }
}
