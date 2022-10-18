// import 'package:flutter/material.dart';

// class ChoiceChipFunction {
//   static List<Widget> techChips(List<Widget> chipsList, selectedIndex) {
//     List<Widget> chips = [];
//     for (int i = 0; i < chipsList.length; i++) {
//       Widget item = Padding(
//         padding: const EdgeInsets.only(left: 10, right: 5),
//         child: ChoiceChip(
//           label: Text(chipsList[i].toString()),
//           labelStyle: const TextStyle(color: Color.fromARGB(255, 14, 6, 6)),
//           backgroundColor: Colors.blue,
//           selected: selectedIndex == i,
//           onSelected: (bool value) {
//             selectedIndex = i;
//           },
//         ),
//       );
//       chips.add(item);
//     }
//     return chips;
//   }
// }
