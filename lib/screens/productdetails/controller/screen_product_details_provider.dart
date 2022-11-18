import 'package:ecommerse/screens/home/model/products/product_model.dart';
import 'package:ecommerse/screens/order/view/screen_order_stepper.dart';
import 'package:ecommerse/screens/productdetails/model/singleproduct_model.dart';
import 'package:ecommerse/screens/productdetails/service/singleproduct_service.dart';
import 'package:ecommerse/screens/productdetails/view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenProductDetailsProvider with ChangeNotifier {
  int? selectedIndex;
  ProductElement? productElement;
  bool isLoading = false;

  void popPage(context) {
    Get.back();
  }

  void choiceshipselect(i) {
    selectedIndex = i;
    notifyListeners();
  }

  void gitocheckOut() {
    Get.to(() => const ScreenStepperOrder());
  }

  void getSingleProductDetails(productId) async {
    isLoading = true;
    notifyListeners();
    await GetSingleProductService.getSingleproductService(productId)
        .then((value) {
      if (value != null) {
        productElement = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
        Get.to(() => const ScreenProductView());
      }
    });
    isLoading = false;
    notifyListeners();
  }
}
