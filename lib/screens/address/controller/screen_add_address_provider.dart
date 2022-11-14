import 'package:ecommerse/screens/address/service/geo_locator_service.dart';
import 'package:ecommerse/screens/address/view/screen_add_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';

class AddAddressProvider with ChangeNotifier {
  TextEditingController homeAddressController = TextEditingController();
  TextEditingController cityAddressController = TextEditingController();
  TextEditingController pinCodeAddressController = TextEditingController();
  TextEditingController countryAddressController = TextEditingController();
  bool isLoading = false;
  void popPage(context) {
    Get.back();
    disposeFeild();
  }

  void navigationToAddAdress(context) {
    Get.to(
      () => const ScreenAddAddress(),
    );
  }

  void getCurrentAddress() async {
    await GeoLocationService.determinePosition().then((addressValue)async {
      isLoading = true;
      notifyListeners();
      if (addressValue != null) {
       await GeoLocationService.getCordinates(
                addressValue.latitude, addressValue.longitude)
            .then((value) {
          if (value != null) {
             disposeFeild() ;
            homeAddressController.text = value.streetAddress.toString();
            cityAddressController.text = value.city.toString();
            pinCodeAddressController.text = value.postal.toString();
            countryAddressController.text = value.countryName.toString();
            isLoading = false;
            notifyListeners();
          }
        });
      }
      isLoading = false;
      notifyListeners();
    });
  }

  void disposeFeild() {
    homeAddressController.clear();
    cityAddressController.clear();
    pinCodeAddressController.clear();
    countryAddressController.clear();
  }
}
