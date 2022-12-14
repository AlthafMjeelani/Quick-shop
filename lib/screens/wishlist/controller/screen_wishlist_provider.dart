import 'dart:developer';
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
  List<WishlistGetModel> wishListProductElement = [];
  num? offerPrice;
  

  void addToWishlist(String productId) async {
    WishlistPostService.wishlistPostService(productId).then((value) {
      if (value == true) {
        AppPopUps.showToast('Add To Wishlist', Colors.green);
      }
    });
    getAllWishlistProducts();
    notifyListeners();
  }

  void getAllWishlistProducts() async {
    isLoading = true;
    notifyListeners();
    await WishlistGetService.wishlistGetService().then((value) {
      if (value != null) {
        log("wishlist is Not Empty");
        wishListProductElement = value;
        notifyListeners();
      } else {
        log("wishlist is Empty");
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

  void deleteWishlistItem(String productId) async {
    WishlistDeteteItemService.wishlistDeteteItemService(productId)
        .then((value) {
      if (value != null) {
        AppPopUps.showToast(value.message.toString(), Colors.green);
        getAllWishlistProducts();
      }
    });
    getAllWishlistProducts();
    notifyListeners();
  }

  // bool checkIsFev(String productId) { 
  //   getAllWishlistProducts();
 

   
  //   log(contains.toString());
  //   notifyListeners();
  //   return false;
  // }
}
