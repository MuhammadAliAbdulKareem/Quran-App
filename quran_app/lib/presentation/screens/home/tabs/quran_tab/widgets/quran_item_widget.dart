import 'package:flutter/material.dart';

class QuranItemWidget extends StatelessWidget {
  const QuranItemWidget({
    super.key,
    required this.versesNumber,
    required this.suraNames,
  });

  final int versesNumber;
  final String suraNames;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                versesNumber.toString(),
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
                suraNames,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
