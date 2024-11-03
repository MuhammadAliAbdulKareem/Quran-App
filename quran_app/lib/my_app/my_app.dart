import 'package:flutter/material.dart';

import 'package:quran_app/core/routes_manager.dart';
import 'package:quran_app/presentation/screens/hadith_details_screen.dart/hadtih_details.dart';
import 'package:quran_app/presentation/screens/home/home_screen.dart';
import 'package:quran_app/presentation/screens/quran_details_screen/quran_details.dart';
import 'package:quran_app/presentation/screens/splash/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../config/theme/my_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran App',
      theme: MyTheme.lightTheme,
      routes: {
        RoutesManager.splashRoute: (_) => const SplashScreen(),
        RoutesManager.homeRoute: (_) => const HomeScreen(),
        RoutesManager.quranDetailsRoute: (_) => const QuranDetails(),
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
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.splashRoute,
    );
  }
}
