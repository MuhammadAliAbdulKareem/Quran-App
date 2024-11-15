import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/setting_tab/widgets/quran_provider.dart';
import 'package:quran_app/presentation/screens/quran_details_screen/widgets/surah_verses_widget.dart';

import '../../../core/assets_manager.dart';
import '../../../providers/theme_provider.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    QuranProvider quranProvider = Provider.of<QuranProvider>(context);
    SurahItem surahItem =
        ModalRoute.of(context)?.settings.arguments as SurahItem;
    if (quranProvider.verses.isEmpty) {
      quranProvider.readQuranFile(surahItem.index + 1);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            themeProvider.isLight()
                ? Assets.imagesLightBg
                : Assets.imagesHomeDarkBackground,
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
        body: quranProvider.verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : ListView.builder(
                itemBuilder: (_, index) =>
                    SurahVersesWidget(verses: quranProvider.verses[index]),
                itemCount: quranProvider.verses.length,
              ),
      ),
    );
  }
}
