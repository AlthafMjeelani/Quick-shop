// import 'dart:developer';

// import 'package:ecommerse/screens/product/model/product_model.dart';
// import 'package:ecommerse/screens/product/service/product_service.dart';
// import 'package:flutter/material.dart';

// class ScreenAllProductProvider with ChangeNotifier {
//   bool isLoading = false;
//   Products? product;
//   List favoriteListOfAllProduct = List.generate(8, (index) => false);

//   // void isFavedAllProduct(int index) {
//   //   favoriteListOfAllProduct[index] = !favoriteListOfAllProduct[index];
//   //   notifyListeners();
//   // }

//   void pop(context) {
//     Navigator.pop(context);
//   }

//   void filterOfAllproducts(index, TabController controller) async {
//     isLoading = true;
//     notifyListeners();
//     await GetAllProductService.getAllProductService().then((value) {
//       log('fiter fuction called');
//       if (value != null) {
//         log(value.products![index].category!.id!.category.toString());
//         if (value.products?[index].category?.id?.category == "SHIRT" &&
//             controller.index == 1) {
//           log('called filter function without null');
//           product = value;
//           notifyListeners();
//         }
//       }
//     });
//     isLoading = false;
//     notifyListeners();
//   }
// }
