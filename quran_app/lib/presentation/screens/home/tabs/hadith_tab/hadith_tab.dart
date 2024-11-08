import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/presentation/screens/home/tabs/setting_tab/widgets/hadith_provider.dart';
import '../../../../../core/assets_manager.dart';
import 'hadith_header_widget.dart';
import 'widgets/hadith_item_widget.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  @override
  Widget build(BuildContext context) {
    HadithProvider hadithProvider = Provider.of<HadithProvider>(context);
    if (hadithProvider.allHadithsList.isEmpty) hadithProvider.loadHadithFile();
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
          child: hadithProvider.allHadithsList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : ListView.builder(
                  itemCount: hadithProvider.allHadithsList.length,
                  itemBuilder: (_, index) => HadithItemWidget(
                      hadith: hadithProvider.allHadithsList[index]),
                ),
        ),
      ],
    );
  }
}

class Hadith {
  final String title;
  final String content;

  const Hadith({required this.title, required this.content});
}
