import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranProvider extends ChangeNotifier {
  List<String> verses = [];
  void readQuranFile(int index) async {
    String fileContant = await rootBundle.loadString("assets/files/$index.txt");
    verses = fileContant.trim().split("\n");
    notifyListeners();
  }
}
