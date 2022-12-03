import 'package:ecommerse/screens/product/model/product_model.dart';
import 'package:ecommerse/screens/order/view/screen_order_stepper.dart';
import 'package:ecommerse/screens/productdetails/service/singleproduct_service.dart';
import 'package:ecommerse/screens/productdetails/view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenProductDetailsProvider with ChangeNotifier {
  int selectedIndex = 1;
  ProductModel? productElement;
  bool isLoading = false;

  void popPage(context) {
    Get.back();
  }

  void choiceshipselect(i) {
    selectedIndex = i;
    notifyListeners();
  }

  void gitocheckOut(String amount) {
    Get.to(() =>  ScreenStepperOrder(amount: amount,));
  }

  void getSingleProductDetails(String productId) async {
    isLoading = true;
    notifyListeners();
    await GetSingleProductService.getSingleproductService(productId)
        .then((value) {
      if (value != null) {
        productElement = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void goToDetailsPage(String offerPrice, String productId) {
    Get.to(
      () => ScreenProductView(
        offerPrice: offerPrice,
        productId: productId,
      ),
    );
  }
}
