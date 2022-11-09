import 'dart:developer';

import 'package:ecommerse/screens/allproducts/view/screen_tabbar.dart';
import 'package:ecommerse/screens/home/model/home_category_model.dart';
import 'package:ecommerse/screens/home/service/home_category_service.dart';
import 'package:flutter/material.dart';

class ScreenHomeProvider with ChangeNotifier {
  List favoriteBoolList = List.generate(4, (index) => false);

  List<HomeCategoryModel?> categoryList = [];
  bool isLoading = false;
// CarouselController carouselController = CarouselController();
  void isFaved(int index) {
    favoriteBoolList[index] = !favoriteBoolList[index];
    notifyListeners();
  }

  void navigatorHomeToViewAll(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const ScreenallCategory();
        },
      ),
    );
  }

  void getAllCategories() async {
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
}
