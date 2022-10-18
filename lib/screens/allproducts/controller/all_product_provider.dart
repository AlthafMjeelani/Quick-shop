import 'package:flutter/cupertino.dart';

class ScreenAllProductProvider with ChangeNotifier {
  List favoriteListOfAllProduct = List.generate(8, (index) => false);

  void isFavedAllProduct(int index) {
    favoriteListOfAllProduct[index] = !favoriteListOfAllProduct[index];
    notifyListeners();
  }

  void pop(context) {
    Navigator.pop(context);
  }
}
