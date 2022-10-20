import 'package:flutter/cupertino.dart';

class ScreenCartProvider with ChangeNotifier {
  int count = 1;
  void countIncrement() {
    count++;
    notifyListeners();
  }

  void countDecrement() {
    if (count > 1) {
      count--;
    } else {
      return;
    }
    notifyListeners();
  }
}
