import 'package:flutter/material.dart';
import 'package:quran_app/presentation/screens/home/tabs/setting_tab/widgets/language_bottom_sheet%20copy.dart';

import 'widgets/theme_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.light,
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
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.english,
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
