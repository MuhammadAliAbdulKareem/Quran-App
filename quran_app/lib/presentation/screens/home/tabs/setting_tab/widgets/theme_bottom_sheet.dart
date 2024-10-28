import 'package:flutter/material.dart';

import '../../../../../../core/colors_manager.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectedThemeWidget(context, "Light"),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          unSelectedThemeWidget(context, "Dark"),
        ],
      ),
    );
  }

  Row selectedThemeWidget(BuildContext context, String selectedTheme) {
    return Row(
      children: [
        Text(
          selectedTheme,
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

  Text unSelectedThemeWidget(BuildContext context, String unSelectedTheme) {
    return Text(
      unSelectedTheme,
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: ColorsManager.white,
          ),
    );
  }
}
