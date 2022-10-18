import 'package:ecommerse/screens/allproducts/view/screen_tabbar.dart';
import 'package:flutter/material.dart';

class ScreenHomeProvider with ChangeNotifier {
  List favoriteBoolList = List.generate(4, (index) => false);

  void isFaved(int index) {
    favoriteBoolList[index] = !favoriteBoolList[index];
    notifyListeners();
  }

  void navigatorHomeToViewAll(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const ScreenallCategory();
        },
      ),
    );
  }
}
