import 'dart:developer';

import 'package:ecommerse/screens/product/model/product_model.dart';
import 'package:ecommerse/screens/wishlist/model/wishlist_get_model.dart';
import 'package:ecommerse/screens/wishlist/service/wishlist_deleteitem_service.dart';
import 'package:ecommerse/screens/wishlist/service/wishlist_get_service.dart';
import 'package:ecommerse/screens/wishlist/service/wishlist_post_service.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/material.dart';

class ScreenWishlistProvider with ChangeNotifier {
  ScreenWishlistProvider() {
    getAllWishlistProducts();
  }
  bool isLoading = false;
  List<WishlistGetModel> wishListProductElement=[];
  num? offerPrice;

  void addToWishlist(String productId) async {
    isLoading = true;
    notifyListeners();
    await WishlistPostService.wishlistPostService(productId).then((value) {
      AppPopUps.showToast('Add To Wishlist', Colors.green);
    });
    isLoading = false;
    notifyListeners();
  }

  void getAllWishlistProducts() async {
    isLoading = true;
    notifyListeners();
    await WishlistGetService.wishlistGetService().then((value) {
      if (value != null) {
        log("wishlist is Not Emptu");
        wishListProductElement = value;
        notifyListeners();
      } else {
        log("wishlist is Emptu");
        isLoading = false;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void calculateOfferPrice(WishlistGetModel product) {
    log(product.price.toString());
    offerPrice = ((product.price! / 100) * (100 - product.offer!) - 1);
    log(offerPrice.toString());
  }


  void deleteWishlistItem(String productId)async{
    WishlistDeteteItemService.wishlistDeteteItemService(productId).then((value) {
      if (value!.success==true) {
        AppPopUps.showToast(value.message.toString(), Colors.green);
      }
    });
  }
}
