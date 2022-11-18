import 'dart:developer';

import 'package:ecommerse/screens/allproducts/view/screen_tabbar.dart';
import 'package:ecommerse/screens/home/model/category/home_category_model.dart';
import 'package:ecommerse/screens/home/model/products/product_model.dart';
import 'package:ecommerse/screens/home/service/home_category_service.dart';
import 'package:ecommerse/screens/home/service/home_product_service.dart';
import 'package:flutter/material.dart';

class ScreenHomeProvider with ChangeNotifier {
  ScreenHomeProvider() {
    getAllProducts();
    getAllCategories();
  }

  List favoriteBoolList = List.generate(4, (index) => false);
  List<HomeCategoryModel?> categoryList = [];
  bool isLoading = false;
  Products? product;
  num offerPrice = 0;

// CarouselController carouselController = CarouselController();
  // void isFaved(int index) {
  //   favoriteBoolList[index] = !favoriteBoolList[index];
  //   notifyListeners();
  // }

  void navigatorHomeToViewAll(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const ScreenallCategory();
        },
      ),
    );
  }

  Future<void> getAllCategories() async {
    isLoading = true;
    notifyListeners();
    await HomeCategoryService.homeCategoryService().then((value) {
      if (value.isNotEmpty) {
        categoryList = value;
      }
    });
    isLoading = false;
    notifyListeners();
    log(categoryList.toString());
  }

  void getAllProducts() async {
    isLoading = true;
    notifyListeners();
    await HomeGetAllProductService().homeProductService().then((value) {
      if (value != null) {
        product = value;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void calculateOfferPrice(index) {
    offerPrice = (product!.products![index].price! / 100) *
        (100 - product!.products![index].offer!);
    log(offerPrice.toString());
  }
}
