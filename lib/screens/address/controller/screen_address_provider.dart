import 'package:ecommerse/screens/address/view/screen_add_address.dart';
import 'package:ecommerse/screens/address/view/screen_address.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenAddressProvider with ChangeNotifier {
  final List<String> radioItem = ['1', '2', '3'];
  String? newValue = '';
  bool isStepperAddressList = false;

  onRadioChange(value) {
    newValue = value.toString();
    notifyListeners();
  }

 

  void goToAddAdressScreen() {
    Get.to(() => const ScreenAddAddress());
  }
    void goToAdressScreen() {
    Get.to(() => const ScreenAddress());
  }

 
}
