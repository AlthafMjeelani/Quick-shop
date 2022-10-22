import 'package:flutter/material.dart';

class ScreenProductDetailsProvider with ChangeNotifier {
  int? selectedIndex;
  List chipsList = ['S', 'M', 'L'];

  void popPage(context) {
    Navigator.pop(context);
  }

  void choiceshipselect(i) {
    selectedIndex = i;
    notifyListeners();
  }
}
