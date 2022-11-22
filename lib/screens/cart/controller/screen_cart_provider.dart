import 'dart:developer';

import 'package:ecommerse/screens/cart/model/cart_get_model.dart';
import 'package:ecommerse/screens/cart/model/cart_post_model.dart';
import 'package:ecommerse/screens/cart/service/cart_get_service.dart';
import 'package:ecommerse/screens/cart/service/cart_post_service.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/material.dart';

class ScreenCartProvider with ChangeNotifier {
  ScreenCartProvider() {
    getAllCartProducts();
  }
  bool isLoading = false;
  int count = 1;
  GetCartProductsModel? cartProducts;
  num offerPrice = 0;
  num realPrice = 0;

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
    final cartModel = CartPostModel(
        color: productColor,
        productId: productId,
        quantity: 1,
        size: productsize);
    isLoading = true;
    notifyListeners();
    CartPostService.cartPostService(cartModel);
    AppPopUps.showToast("Add To Cart", Colors.green);
    isLoading = false;
    notifyListeners();
  }

  void getAllCartProducts() async {
    isLoading = true;
    notifyListeners();
    await CartGetService.cartGetService().then((value) {
      if (value != null) {
        cartProducts = value;
        notifyListeners();
      }
      isLoading = false;
      notifyListeners();
    });
    isLoading = false;
    notifyListeners();
  }

  void calculateOfferPrice(ProductDetails product) {
    log(product.price.toString());
    offerPrice = ((product.price! / 100) * (100 - product.offer!) - 1);
    log(offerPrice.toString());
  }

  void increaseQuantity(ProductCartElement product) {
    product.quantity = (product.quantity! + 1);
    offerPrice = offerPrice + realPrice;
    notifyListeners();
  }

  void decreaseQuantity(ProductCartElement product) {
    if (product.quantity == 1) {
      return;
    }
    offerPrice = offerPrice - realPrice;
    product.quantity;
    notifyListeners();
  }
}
