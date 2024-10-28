import 'package:flutter/material.dart';

import '../../../../../../core/colors_manager.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectedThemeWidget(context, "English"),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          unSelectedThemeWidget(context, "العربية"),
        ],
      ),
    );
  }

  Widget selectedThemeWidget(BuildContext context, selectedLanguage) {
    return Row(
      children: [
        Text(
          selectedLanguage,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const Spacer(),
        const Icon(
          Icons.check_box_outlined,
          size: 30,
          color: ColorsManager.black,
        ),
      ],
    );
  }

  Widget unSelectedThemeWidget(
      BuildContext context, String unSelectedLanguage) {
    return Text(
      'العربية',
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: ColorsManager.white,
          ),
    );
  }
}
