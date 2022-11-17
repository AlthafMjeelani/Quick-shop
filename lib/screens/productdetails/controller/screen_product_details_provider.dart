import 'package:ecommerse/screens/order/view/screen_order_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenProductDetailsProvider with ChangeNotifier {
  int? selectedIndex;

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

  // void gitocheckOut() {
  //   Get.to(() =>  StepperDemo());
  // }

}
