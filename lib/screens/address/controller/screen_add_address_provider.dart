import 'dart:async';

import 'package:ecommerse/screens/address/service/geo_locator_service.dart';
import 'package:ecommerse/screens/address/view/screen_add_address.dart';
import 'package:flutter/cupertino.dart';
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
  TextEditingController countryAddressController = TextEditingController();
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
      () => const ScreenAddAddress(),
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
              countryAddressController.text = value.countryName.toString();
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
          countryAddressController.text = value.countryName.toString();
        }
      },
    );
    notifyListeners();
  }

  void disposeFeild() {
    homeAddressController.clear();
    cityAddressController.clear();
    pinCodeAddressController.clear();
    countryAddressController.clear();
  }
}
