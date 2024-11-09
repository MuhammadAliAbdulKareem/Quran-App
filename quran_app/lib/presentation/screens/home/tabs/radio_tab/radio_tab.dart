import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/assets_manager.dart';
import 'package:quran_app/providers/language_provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.imagesRadioImage),
        SizedBox(
          height: screenSize.height * 0.05,
        ),
        Text(
          "إذاعة القرآن الكريم",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(
          height: screenSize.height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: languageProvider.isEnglish()
                  ? const Icon(Icons.skip_previous)
                  : const Icon(Icons.skip_next),
              color: Theme.of(context).dividerColor,
              iconSize: 35.0,
            ),
            SizedBox(
              width: screenSize.width * 0.05,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              color: Theme.of(context).dividerColor,
              iconSize: 45.0,
            ),
            SizedBox(
              width: screenSize.width * 0.05,
            ),
            IconButton(
              onPressed: () {},
              icon: languageProvider.isEnglish()
                  ? const Icon(Icons.skip_next)
                  : const Icon(Icons.skip_previous),
              color: Theme.of(context).dividerColor,
              iconSize: 35.0,
            ),
          ],
        )
      ],
    );
  }
}
