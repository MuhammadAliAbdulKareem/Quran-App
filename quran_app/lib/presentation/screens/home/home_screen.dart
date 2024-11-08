import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/setting_tab/settings_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/setting_tab/widgets/hadith_provider.dart';
import 'package:quran_app/presentation/screens/home/tabs/tasbeh_tab/tasbeh_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/assets_manager.dart';
import '../../../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  List<Widget> tabs = [
    const QuranTab(),
    ChangeNotifierProvider(
      create: (context) => HadithProvider(),
      child: const HadithTab(),
    ),
    const TasbehTab(),
    const RadioTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            themeProvider.isLight()
                ? Assets.imagesLightBg
                : Assets.imagesHomeDarkBackground,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.appTitle,
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor,
          ),
          child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  selectedTab = index;
                });
              },
              currentIndex: selectedTab,
              items: [
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      Assets.imagesQuranIcon,
                    ),
                    size: 32.0,
                  ),
                  label: AppLocalizations.of(context)!.quranTab,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(Assets.imagesHadithIcon),
                  ),
                  label: AppLocalizations.of(context)!.hadithTab,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(Assets.imagesSebhaIcon),
                    size: 40.0,
                  ),
                  label: AppLocalizations.of(context)!.sebhaTab,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(Assets.imagesRadioIcon),
                  ),
                  label: AppLocalizations.of(context)!.radioTab,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settingTab,
                ),
              ]),
        ),
        body: tabs[selectedTab],
      ),
    );
  }
}
