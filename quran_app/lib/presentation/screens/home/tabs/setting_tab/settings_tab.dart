import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/presentation/screens/home/tabs/setting_tab/widgets/language_bottom_sheet%20copy.dart';
import 'package:quran_app/providers/language_provider.dart';

import '../../../../../providers/theme_provider.dart';
import 'widgets/theme_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: screenSize.height * 0.005,
          ),
          InkWell(
            onTap: () => showThemeBottomSheet(context: context),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 2.0,
                ),
              ),
              child: Text(
                themeProvider.isLight()
                    ? AppLocalizations.of(context)!.light
                    : AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: screenSize.height * 0.005,
          ),
          InkWell(
            onTap: () => showLanguageBottomSheet(context: context),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 2.0,
                ),
              ),
              child: Text(
                languageProvider.isEnglish()
                    ? AppLocalizations.of(context)!.english
                    : AppLocalizations.of(context)!.arabic,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const ThemeBottomSheet(),
    );
  }

  void showLanguageBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const LanguageBottomSheet(),
    );
  }
}
