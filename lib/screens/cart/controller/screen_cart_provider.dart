import 'dart:developer';

import 'package:ecommerse/screens/cart/model/cart_get_model.dart';
import 'package:ecommerse/screens/cart/model/cart_post_model.dart';
import 'package:ecommerse/screens/cart/service/cart_get_service.dart';
import 'package:ecommerse/screens/cart/service/cart_post_service.dart';
import 'package:ecommerse/screens/order/view/screen_order_stepper.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenCartProvider with ChangeNotifier {
  ScreenCartProvider() {
    getAllCartProducts();
  }
  bool isLoading = false;
  bool isLoadingAddCart = false;
  int count = 1;
  GetCartProductsModel? cartProducts;
  List<ProductCartElement>? cartProductList;
  num offerPrice = 0;
  num totalPrice = 0;

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

  void goTocheckOut(){
    Get.to(()=> ScreenStepperOrder(amount: offerPrice.toString()));
  }

  void addToCart(
      String productId, String productsize, String productColor) async {
    final cartModel = CartPostModel(
        color: productColor,
        productId: productId,
        quantity: 1,
        size: productsize);
    isLoadingAddCart = true;
    notifyListeners();
    CartPostService.cartPostService(cartModel).then((value) {
      if (value == true) {
        AppPopUps.showToast("Add To Cart", Colors.green);
        isLoadingAddCart = false;
        notifyListeners();
      }
    });
    isLoadingAddCart = false;
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

  void calculateOfferPrice(int index) {
    final productList = cartProductList?[index];
//log(productList!.product!.price.toString());
    if (productList != null) {
      totalPrice = 0;
      offerPrice = productList.product!.price! /
              100 *
              (100 - productList.product!.offer!) -
          1;

      for (var i = 0; i < cartProductList!.length; i++) {
        totalPrice = ((cartProductList![i].product!.price! / 100) -
                    cartProductList![i].product!.price! / 100) *
                (100 - cartProductList![i].product!.offer!) -
            1;
      }
    }
    log('total price${totalPrice.toString()}');
  }
}
