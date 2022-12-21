import 'dart:developer';

import 'package:ecommerse/screens/categoryview/model/category_product_model.dart';
import 'package:ecommerse/screens/categoryview/service/category_wisw_product_service.dart';
import 'package:ecommerse/screens/productdetails/view/product_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';

class CategoryProductController with ChangeNotifier {
  bool isLoading = false;
  List<CategoryProductModel>? catedoryProductsList;
  num offerPrice = 0;

  void getAllCatedoryProducts(String categoryId) async {
    isLoading = true;
    notifyListeners();
    await CategoryWiseProductService.categoryWiseProductService(categoryId)
        .then((value) {
      if (value != null) {
        catedoryProductsList = value;
        isLoading = false;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void calculateOfferPrice(CategoryProductModel product) {
    log(product.price.toString());
    offerPrice = ((product.price! / 100) * (100 - product.offer!) - 1);
    log(offerPrice.toString());
  }

  void goToDeatailsPage(String productId,String offerPrice) {
    Get.to(
      () => ScreenProductView(
          offerPrice:offerPrice, productId: productId),
    );
  }
}
