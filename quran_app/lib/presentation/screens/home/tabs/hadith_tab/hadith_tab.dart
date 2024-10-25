import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/assets_manager1.dart';
import 'hadith_header_widget.dart';
import 'widgets/hadith_item_widget.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<Hadith> allHadithsList = [];

  @override
  Widget build(BuildContext context) {
    if (allHadithsList.isEmpty) loadHadithFile();
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            Assets.imagesHadithHeader,
          ),
        ),
        const HadithHeaderWidget(),
        Expanded(
          flex: 3,
          child: allHadithsList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : ListView.builder(
                  itemCount: allHadithsList.length,
                  itemBuilder: (_, index) =>
                      HadithItemWidget(hadith: allHadithsList[index]),
                ),
        ),
      ],
    );
  }

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
    setState(() {});
  }
}

class Hadith {
  final String title;
  final String content;

  const Hadith({required this.title, required this.content});
}
