import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/language_provider.dart';
import 'package:quran_app/providers/theme_provider.dart';

import '../../../../../../core/colors_manager.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              languageProvider.changeAppLanguage(
                const Locale(
                  "en",
                ),
              );
            },
            child: languageProvider.isEnglish()
                ? selectedLanguageWidget(
                    context,
                    "English",
                    themeProvider.isLight(),
                  )
                : unSelectedLanguageWidget(context, "English"),
          ),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          InkWell(
            onTap: () {
              languageProvider.changeAppLanguage(
                const Locale("ar"),
              );
            },
            child: languageProvider.isArabic()
                ? selectedLanguageWidget(
                    context,
                    "العربية",
                    themeProvider.isLight(),
                  )
                : unSelectedLanguageWidget(context, "العربية"),
          ),
        ],
      ),
    );
  }

  Widget selectedLanguageWidget(
      BuildContext context, selectedLanguage, bool isLight) {
    return Row(
      children: [
        Text(
          selectedLanguage,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const Spacer(),
        Icon(
          Icons.check_box_outlined,
          size: 30,
          color: isLight ? ColorsManager.black : ColorsManager.yellow,
        ),
      ],
    );
  }

  Widget unSelectedLanguageWidget(
      BuildContext context, String unSelectedLanguage) {
    return Text(
      unSelectedLanguage,
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: ColorsManager.white,
          ),
    );
  }
}
