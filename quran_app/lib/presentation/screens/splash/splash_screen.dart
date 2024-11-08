import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/assets_manager.dart';
import '../../../core/routes_manager.dart';
import '../../../providers/theme_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider myProvider = Provider.of<ThemeProvider>(context);
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
      }
    });
    return Scaffold(
      body: Image.asset(
        myProvider.isLight()
            ? Assets.imagesLightSplash
            : Assets.imagesDarkSplash,
        fit: BoxFit.fill,
        height: double.infinity,
      ),
    );
  }
}
