import 'package:flutter/material.dart';
import 'package:quran_app/core/assets_manager.dart';
import 'package:quran_app/core/colors_manager.dart';
import 'package:quran_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/setting_tab/settings_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/tasbeh_tab/tasbeh_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  List<Widget> tabs = const [
    QuranTab(),
    HadithTab(),
    TasbehTab(),
    RadioTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            AssetsManager.lightHomeBg,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.appTitle,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                selectedTab = index;
              });
            },
            currentIndex: selectedTab,
            items: [
              BottomNavigationBarItem(
                backgroundColor: ColorsManager.goldColor,
                icon: const ImageIcon(
                  AssetImage(
                    AssetsManager.quranIcon,
                  ),
                  size: 32.0,
                ),
                label: AppLocalizations.of(context)!.quranTab,
              ),
              BottomNavigationBarItem(
                backgroundColor: ColorsManager.goldColor,
                icon: const ImageIcon(
                  AssetImage(AssetsManager.hadithIcon),
                ),
                label: AppLocalizations.of(context)!.hadithTab,
              ),
              BottomNavigationBarItem(
                backgroundColor: ColorsManager.goldColor,
                icon: const ImageIcon(
                  AssetImage(AssetsManager.tasbehIcon),
                  size: 40.0,
                ),
                label: AppLocalizations.of(context)!.sebhaTab,
              ),
              BottomNavigationBarItem(
                backgroundColor: ColorsManager.goldColor,
                icon: const ImageIcon(
                  AssetImage(AssetsManager.radioIcon),
                ),
                label: AppLocalizations.of(context)!.radioTab,
              ),
              BottomNavigationBarItem(
                backgroundColor: ColorsManager.goldColor,
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settingTab,
              ),
            ]),
        body: tabs[selectedTab],
      ),
    );
  }
}
