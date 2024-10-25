import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/assets_manager.dart';
import 'package:quran_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:quran_app/presentation/screens/quran_details_screen/widgets/surah_verses_widget.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SurahItem surahItem =
        ModalRoute.of(context)?.settings.arguments as SurahItem;
    if (verses.isEmpty) readQuranFile(surahItem.index + 1);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            AssetsManager.lightHomeBg,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            surahItem.surahName,
          ),
        ),
        body: verses.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (_, index) =>
                    SurahVersesWidget(verses: verses[index]),
                itemCount: verses.length,
              ),
      ),
    );
  }

  void readQuranFile(int index) async {
    String fileContant = await rootBundle.loadString("assets/files/$index.txt");
    verses = fileContant.trim().split("\n");
    setState(() {});
  }
}
