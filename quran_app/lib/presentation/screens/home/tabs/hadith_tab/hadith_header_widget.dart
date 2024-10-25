import 'package:flutter/material.dart';

import '../../../../../core/strings_manager.dart';

class HadithHeaderWidget extends StatelessWidget {
  const HadithHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
      ),
      child: Text(
        StringsManager.hadithHeaderLabel,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}