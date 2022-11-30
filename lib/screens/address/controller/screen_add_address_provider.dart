import 'dart:async';

import 'package:ecommerse/screens/address/model/adddress_post_mode.dart';
import 'package:ecommerse/screens/address/service/adress_post_service.dart';
import 'package:ecommerse/screens/address/service/geo_locator_service.dart';
import 'package:ecommerse/screens/address/view/screen_add_address.dart';
import 'package:ecommerse/screens/address/view/screen_address.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/route_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressProvider with ChangeNotifier {
  // AddAddressProvider() {
  //   currentLocation();
  // }
  TextEditingController homeAddressController = TextEditingController();
  TextEditingController cityAddressController = TextEditingController();
  TextEditingController pinCodeAddressController = TextEditingController();
  TextEditingController nameAddressController = TextEditingController();
  TextEditingController phoneAddressController = TextEditingController();
  bool isLoading = false;
  Set<Marker> markers = {};
  Position? location;
  CameraPosition initialLocation = const CameraPosition(
    target: LatLng(11.1518356, 75.8930459),
    zoom: 14.4746,
  );

  // void currentLocation() async {
  //   location = await Geolocator.getCurrentPosition();
  //   notifyListeners();
  //   initialLocation = CameraPosition(
  //     target: LatLng(location!.latitude, location!.longitude),
  //     zoom: 14.4746,
  //   );
  //   notifyListeners();
  // }

  Completer<GoogleMapController> googleMapController = Completer();
  void popPage(context) {
    Get.back();
    disposeFeild();
  }

  void navigationToAddAdress(context) {
    Get.to(
      () => ScreenAddAddress(),
    );
  }

  void getCurrentAddress() async {
    await GeoLocationService.determinePosition().then((addressValue) async {
      isLoading = true;
      notifyListeners();
      if (addressValue != null) {
        await GeoLocationService.getCordinates(
                addressValue.latitude, addressValue.longitude)
            .then(
          (value) {
            if (value != null) {
              disposeFeild();
              homeAddressController.text = value.streetAddress.toString();
              cityAddressController.text = value.city.toString();
              pinCodeAddressController.text = value.postal.toString();
            }
          },
        );
        isLoading = false;
        notifyListeners();
      }
      isLoading = false;
      notifyListeners();
    });
  }

  void addMarker(double lat, double lon) async {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('defaultLocation'),
        position: LatLng(lat, lon),
      ),
    );
    notifyListeners();
    await GeoLocationService.getCordinates(lat, lon).then(
      (value) {
        if (value != null) {
          homeAddressController.text = value.streetAddress.toString();
          cityAddressController.text = value.city.toString();
          pinCodeAddressController.text = value.postal.toString();
        }
      },
    );
    notifyListeners();
  }

  void disposeFeild() {
    homeAddressController.clear();
    cityAddressController.clear();
    pinCodeAddressController.clear();
    nameAddressController.clear();
    phoneAddressController.clear();
  }

  void addAddress(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final model = AddressPostModel(
        address: homeAddressController.text,
        city: cityAddressController.text,
        name: nameAddressController.text,
        phone: phoneAddressController.text,
        pincode: pinCodeAddressController.text,
      );
      isLoading = true;
      notifyListeners();
      await AddressPostService.addressPostService(model).then((value) {
        if (value == true) {
          AppPopUps.showToast('Address Added', Colors.green);
          disposeFeild();
          isLoading = false;
          notifyListeners();
          
          Get.off(()=>const ScreenAddress());
        }
      });
      isLoading = false;
      notifyListeners();
    }
  }

  String? validator(String? value) {
    {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    }
  }
}
