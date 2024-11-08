import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/language_provider.dart';
import 'package:quran_app/providers/theme_provider.dart';

import 'my_app/my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()..getCurrentTheme(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider()..getCurrentLanguage(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
