import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:flutter/material.dart';

class ScreenProductDetailsProvider with ChangeNotifier {
  int? selectedIndex;
  List chipsList = ['S', 'M', 'L'];

  List<Widget> chipselection() {
    List<Widget> chips = [];
    for (int i = 0; i < chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          label: Text(
            chipsList[i].toString(),
            style: AppTextStyle.kTextBlack20Size,
          ),
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 14, 6, 6),
          ),
          selectedColor: Colors.blue,
          selected: selectedIndex == i,
          onSelected: (bool value) {
            selectedIndex = i;
            notifyListeners();
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  void popPage(context) {
    Navigator.pop(context);
  }
}
