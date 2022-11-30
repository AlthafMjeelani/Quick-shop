import 'dart:developer';

import 'package:ecommerse/screens/address/model/address_get_model.dart';
import 'package:ecommerse/screens/address/service/address_delete_service.dart';
import 'package:ecommerse/screens/address/service/address_get_service.dart';
import 'package:ecommerse/screens/address/view/screen_add_address.dart';
import 'package:ecommerse/screens/address/view/screen_address.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenAddressProvider with ChangeNotifier {
  // ScreenAddressProvider(){
  //   getAllAddress();
  // }
  List<AddressGetModel> address = [];
  String? newValue = '';
  bool isStepperAddressList = false;
  bool isLoading = false;

  onRadioChange(value) {
    newValue = value.toString();
    notifyListeners();
  }

  void goToAddAdressScreen() {
    Get.to(() => ScreenAddAddress());
  }

  void goToAdressScreen() {
    Get.off(() => const ScreenAddress());
  }

  void pop() {
    Get.back();
  }

  void getAllAddress() async {
    isLoading = true;
    notifyListeners();
    await AddressGetService.addressGetService().then((value) {
      if (value != null) {
        log("address is Not Emptu");
        address = value;
        notifyListeners();
      } else {
        log("address is Emptu");
        isLoading = false;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void addressdelete(String addressId) async {
    await AddressDeteteService.addressDeteteService(addressId).then((value) {
      if (value!.success == true) {
        AppPopUps.showToast(value.message.toString(), Colors.green);
      }
    });
  }
}
