import 'package:ecommerse/screens/categoryview/model/category_product_model.dart';
import 'package:ecommerse/screens/categoryview/service/category_wisw_product_service.dart';
import 'package:flutter/cupertino.dart';

class CategoryProductController with ChangeNotifier {
  bool isLoading = false;
  List<CategoryProductModel>? catedoryProductsList;

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
}
