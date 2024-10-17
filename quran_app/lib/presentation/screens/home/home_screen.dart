import 'package:flutter/material.dart';
import 'package:quran_app/core/assets_manager.dart';
import 'package:quran_app/core/colors_manager.dart';
import 'package:quran_app/core/strings_manager.dart';
import 'package:quran_app/presentation/screens/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/setting_tab/settings_tab.dart';
import 'package:quran_app/presentation/screens/home/tabs/tasbeh_tab/tasbeh_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  List<Widget> tabs = const [
    RadioTab(),
    TasbehTab(),
    HadithTab(),
    QuranTab(),
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
          title: const Text(
            StringsManager.appTitle,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                selectedTab = index;
              });
            },
            currentIndex: selectedTab,
            items: const [
              BottomNavigationBarItem(
                backgroundColor: ColorsManager.goldColor,
                icon: ImageIcon(
                  AssetImage(AssetsManager.radioIcon),
                ),
                label: StringsManager.radioLabel,
              ),
              BottomNavigationBarItem(
                backgroundColor: ColorsManager.goldColor,
                icon: ImageIcon(
                  AssetImage(AssetsManager.tasbehIcon),
                  size: 40.0,
                ),
                label: StringsManager.tasbehLabel,
              ),
              BottomNavigationBarItem(
                backgroundColor: ColorsManager.goldColor,
                icon: ImageIcon(
                  AssetImage(AssetsManager.hadithIcon),
                ),
                label: StringsManager.hadithLabel,
              ),
              BottomNavigationBarItem(
                backgroundColor: ColorsManager.goldColor,
                icon: ImageIcon(
                  AssetImage(
                    AssetsManager.quranIcon,
                  ),
                  size: 32.0,
                ),
                label: StringsManager.quranLabel,
              ),
              BottomNavigationBarItem(
                backgroundColor: ColorsManager.goldColor,
                icon: Icon(Icons.settings),
                label: StringsManager.settingsLabel,
              ),
            ]),
        body: tabs[selectedTab],
      ),
    );
  }
}
