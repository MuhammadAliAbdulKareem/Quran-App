import 'package:flutter/material.dart';

class SurahVersesWidget extends StatelessWidget {
  const SurahVersesWidget({
    super.key,
    required this.verses,
  });

  final String verses;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 8.0,
      shadowColor: Colors.deepOrange,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Text(
        verses,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
