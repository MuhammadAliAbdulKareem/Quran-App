import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';

class HadithProvider extends ChangeNotifier {
  List<Hadith> allHadithsList = [];

  void loadHadithFile() async {
    String fileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadiths = fileContent.trim().split("#");
    for (var everyHadith in allHadiths) {
      List<String> hadithLines = everyHadith.trim().split("\n");
      String hadithTitle = hadithLines[0];
      hadithLines.removeAt(0);
      String hadithContent = hadithLines.join("\n");
      allHadithsList.add(Hadith(title: hadithTitle, content: hadithContent));
    }
    notifyListeners();
  }
}
