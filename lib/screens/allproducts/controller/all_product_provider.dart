import 'package:ecommerse/screens/productdetails/view/product_details_view.dart';
import 'package:flutter/material.dart';

class ScreenAllProductProvider with ChangeNotifier {
  List favoriteListOfAllProduct = List.generate(8, (index) => false);

  void isFavedAllProduct(int index) {
    favoriteListOfAllProduct[index] = !favoriteListOfAllProduct[index];
    notifyListeners();
  }

  void pop(context) {
    Navigator.pop(context);
  }

  void navigatorAllToView(
    context,
    String imageUrl,
    String brandName,
    String price,
    String productName,
    String productDisprice,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScreenProductView(
          imageUrl: imageUrl,
          brandName: brandName,
          price: price,
          productName: productName,
          productDisprice: productDisprice,
        ),
      ),
    );
  }
}
