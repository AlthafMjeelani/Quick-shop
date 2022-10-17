import 'package:flutter/cupertino.dart';

class BottomNavProvider with ChangeNotifier {
  int currentPageIndex = 0;
  Future<bool>? bottomNavbar() {
    if (currentPageIndex != 0) {
      currentPageIndex = 0;
      notifyListeners();
    }
    return null;
  }

  void bottomShift(newIndex) {
    currentPageIndex = newIndex;
    notifyListeners();
  }
}
