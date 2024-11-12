import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/assets_manager.dart';
import 'package:quran_app/core/colors_manager.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran_app/providers/language_provider.dart';
import '../../../../../providers/theme_provider.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab>
    with SingleTickerProviderStateMixin {
  List<String> tasbehKeywords = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];
  int tasbehCounter = 1;
  int index = 0;
  late String tasbehText;
  @override
  void initState() {
    super.initState();
    tasbehText = tasbehKeywords[index];
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            // left: 160.0,
            left: themeProvider.isLight() ? 160.0 : 170.0,
            child: Image.asset(
              themeProvider.isLight()
                  ? Assets.imagesHeadofseb7a
                  : Assets.imagesHeadOfSebhaDark,
            ),
          ),
          Positioned(
            // top: 40.0,
            // left: 20.0,
            top: themeProvider.isLight() ? 40.0 : 80.0,
            left: themeProvider.isLight() ? 20.0 : 65.0,
            child: Transform.rotate(
              angle: (tasbehCounter % 33) * (2 * math.pi / 33),
              child: Image.asset(
                themeProvider.isLight()
                    ? Assets.imagesBodyofseb7a
                    : Assets.imagesBodyofseb7adark,
              ),
            ),
          ),
          Positioned(
            top: 350.0,
            left: languageProvider.isEnglish() ? 75 : 105,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  AppLocalizations.of(context)!.numberOfTasbeehs,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12.0),
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                  ),
                  child: Text(tasbehCounter.toString()),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: themeProvider.isLight()
                          ? Theme.of(context).primaryColor
                          : ColorsManager.yellow,
                      fixedSize: const Size(150, 45)),
                  onPressed: () {
                    setState(() {
                      tasbehCounter++;
                      if (tasbehCounter > 33) {
                        tasbehCounter = 1;
                        index =
                            index < tasbehKeywords.length - 1 ? index + 1 : 0;
                        tasbehText = tasbehKeywords[index];
                      }
                      // if (tasbehCounter > 33) {
                      //   tasbehCounter = 1;
                      //   tasbehText == "سبحان الله"
                      //       ? tasbehText = "الحمدلله"
                      //       : tasbehText == "الحمدلله"
                      //           ? tasbehText = "الله أكبر"
                      //           : tasbehText = "سبحان الله";
                      // }
                    });
                  },
                  child: Text(
                    tasbehText,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 22.0,
                          color: themeProvider.isLight()
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import '../../../../../core/assets_manager1.dart';

// class TasbehTab extends StatefulWidget {
//   const TasbehTab({super.key});

//   @override
//   _TasbehTabState createState() => _TasbehTabState();
// }

// class _TasbehTabState extends State<TasbehTab> {
//   int counter = 0;
//   String tasbeehText = 'سبحان الله';

//   void incrementCounter() {
//     setState(() {
//       counter++;
//       if (counter > 33) {
//         counter = 1; // Reset counter when greater than 33
//         if (tasbeehText == 'سبحان الله') {
//           tasbeehText = 'الحمدلله';
//         } else if (tasbeehText == 'الحمدلله') {
//           tasbeehText = 'الله أكبر';
//         } else {
//           tasbeehText = 'سبحان الله'; // Cycle back to start
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Header Decoration
//           Container(
//             margin: const EdgeInsets.only(top: 50),
//             child: Column(
//               children: [
//                 Image.asset(
//                   Assets.imagesHeadofseb7a,
//                   height: 150.0,
//                 ),
//                 const SizedBox(height: 20),
//                 // Circular Rosary Image
//                 Image.asset(Assets.imagesBodyofseb7a, height: 150),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Tasbeeh Count Text
//           const Text(
//             'عدد التسبيحات',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),

//           // Count Display
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//             decoration: BoxDecoration(
//               color: Colors.brown[100],
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(
//               '$counter',
//               style: const TextStyle(fontSize: 30),
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Button to Increase Count
//           ElevatedButton(
//             onPressed: incrementCounter,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.brown, // Button color
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//             ),
//             child: Text(
//               tasbeehText,
//               style: const TextStyle(fontSize: 20),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
