import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/colors_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../providers/theme_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                themeProvider.changeAppTheme(ThemeMode.light);
              },
              child: themeProvider.isLight()
                  ? selectedThemeWidget(
                      context,
                      AppLocalizations.of(context)!.light,
                      themeProvider.isLight())
                  : unSelectedThemeWidget(
                      context, AppLocalizations.of(context)!.light)),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          InkWell(
            onTap: () {
              themeProvider.changeAppTheme(ThemeMode.dark);
            },
            child: themeProvider.isDark()
                ? selectedThemeWidget(
                    context,
                    AppLocalizations.of(context)!.dark,
                    themeProvider.isLight(),
                  )
                : unSelectedThemeWidget(
                    context, AppLocalizations.of(context)!.dark),
          ),
        ],
      ),
    );
  }

  Row selectedThemeWidget(
      BuildContext context, String selectedTheme, bool isLight) {
    return Row(
      children: [
        Text(
          selectedTheme,
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

  Text unSelectedThemeWidget(BuildContext context, String unSelectedTheme) {
    return Text(
      unSelectedTheme,
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: ColorsManager.white,
          ),
    );
  }
}
