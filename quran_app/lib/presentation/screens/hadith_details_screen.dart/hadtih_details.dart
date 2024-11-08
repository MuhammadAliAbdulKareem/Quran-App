import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/colors_manager.dart';
import 'package:quran_app/core/strings_manager.dart';
import 'package:quran_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import '../../../core/assets_manager.dart';
import '../../../providers/theme_provider.dart';

class HadtihDetails extends StatelessWidget {
  const HadtihDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider myProvider = Provider.of<ThemeProvider>(context);
    Hadith hadithItem = ModalRoute.of(context)?.settings.arguments as Hadith;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            myProvider.isLight()
                ? Assets.imagesLightBg
                : Assets.imagesHomeDarkBackground,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            StringsManager.appTitle,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Card(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
                child: Text(
                  hadithItem.title,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                color: myProvider.isLight()
                    ? ColorsManager.white
                    : ColorsManager.yellow,
                thickness: 1.0,
                indent: 25.0,
                endIndent: 25.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Text(
                  hadithItem.content,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
