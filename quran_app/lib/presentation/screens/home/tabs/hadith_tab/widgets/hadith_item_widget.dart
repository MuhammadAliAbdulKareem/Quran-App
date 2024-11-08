import 'package:flutter/material.dart';
import 'package:quran_app/core/routes_manager.dart';

import '../hadith_tab.dart';

class HadithItemWidget extends StatelessWidget {
  const HadithItemWidget({
    super.key,
    required this.hadith,
  });

  final Hadith hadith;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
          context, RoutesManager.hadithDetailsRoute,
          arguments: hadith),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          hadith.title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
