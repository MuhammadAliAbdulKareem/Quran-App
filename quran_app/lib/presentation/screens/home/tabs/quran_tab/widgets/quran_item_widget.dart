import 'package:flutter/material.dart';
import 'package:quran_app/core/routes_manager.dart';

import '../quran_tab.dart';

class QuranItemWidget extends StatelessWidget {
  const QuranItemWidget({
    super.key,
    required this.surahItem,
  });

  final SurahItem surahItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        RoutesManager.quranDetailsRoute,
        arguments: surahItem,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  surahItem.surahName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            VerticalDivider(
              color: Theme.of(context).dividerColor,
              thickness: 2,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  surahItem.versesNumber.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
