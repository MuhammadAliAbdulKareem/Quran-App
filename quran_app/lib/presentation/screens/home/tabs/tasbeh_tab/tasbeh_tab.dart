import 'package:flutter/material.dart';
import 'package:quran_app/core/assets_manager1.dart';
import 'dart:math' as math;

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab>
    with SingleTickerProviderStateMixin {
  int tasbehCounter = 1;
  String tasbehText = "سبحان الله";

  // int index = 0;
  // List<String> tasbehKeywords = [
  //   'سبحان الله',
  //   'الحمد لله',
  //   'الله أكبر',
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 160.0,
            child: Image.asset(
              Assets.imagesHeadofseb7a,
            ),
          ),
          Positioned(
            top: 40.0,
            left: 20.0,
            child: Transform.rotate(
              angle: (tasbehCounter % 33) * (2 * math.pi / 33),
              child: Image.asset(
                Assets.imagesBodyofseb7a,
              ),
            ),
          ),
          Positioned(
            top: 350.0,
            left: 105,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'عدد التسبيحات',
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
                      backgroundColor: Theme.of(context).primaryColor,
                      fixedSize: const Size(150, 45)),
                  onPressed: () {
                    setState(() {
                      tasbehCounter++;
                      if (tasbehCounter > 33) {
                        tasbehCounter = 1;
                        tasbehText == "سبحان الله"
                            ? tasbehText = "الحمدلله"
                            : tasbehText == "الحمدلله"
                                ? tasbehText = "الله أكبر"
                                : tasbehText = "سبحان الله";
                      }
                    });
                  },
                  child: Text(
                    tasbehText,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 22.0,
                          color: Colors.white,
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
