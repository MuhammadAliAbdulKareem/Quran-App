import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quran_app/core/routes_manager.dart';
import 'package:quran_app/presentation/screens/hadith_details_screen.dart/hadtih_details.dart';
import 'package:quran_app/presentation/screens/home/home_screen.dart';
import 'package:quran_app/presentation/screens/home/tabs/setting_tab/widgets/quran_provider.dart';
import 'package:quran_app/presentation/screens/quran_details_screen/quran_details.dart';
import 'package:quran_app/presentation/screens/splash/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran_app/providers/language_provider.dart';
import '../config/theme/my_theme.dart';
import '../providers/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      title: 'Quran App',
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: themeProvider.currentTheme,
      routes: {
        RoutesManager.splashRoute: (_) => const SplashScreen(),
        RoutesManager.homeRoute: (_) => const HomeScreen(),
        RoutesManager.quranDetailsRoute: (_) => ChangeNotifierProvider(
            create: (context) => QuranProvider(), child: const QuranDetails()),
        RoutesManager.hadithDetailsRoute: (_) => const HadtihDetails(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // localizationsDelegates: const [
      // AppLocalization.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: languageProvider.currentLanguage,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.homeRoute,
    );
  }
}
