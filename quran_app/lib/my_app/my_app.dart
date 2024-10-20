import 'package:flutter/material.dart';
import 'package:quran_app/core/routes_manager.dart';
import 'package:quran_app/presentation/screens/home/home_screen.dart';
import 'package:quran_app/presentation/screens/splash/splash_screen.dart';

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
      },
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.splashRoute,
    );
  }
}
