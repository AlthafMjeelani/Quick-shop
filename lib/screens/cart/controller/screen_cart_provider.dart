import 'package:ecommerse/screens/cart/model/cart_model.dart';
import 'package:ecommerse/screens/cart/service/cart_post_service.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/material.dart';

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

  void addToCart(
      String productId, String productsize, String productColor) async {
    final cartModel = CartModel(
        color: productColor,
        productId: productId,
        quantity: 1,
        size: productsize);
    CartPostService.cartPostService(cartModel).then(
      (value) {
        if (value == true) {
          AppPopUps.showToast("Added To Cart", Colors.green);
        }
      },
    );
  }
}
