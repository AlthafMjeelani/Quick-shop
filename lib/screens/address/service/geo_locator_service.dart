import 'dart:developer';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocationService {
  static Future<Position?> determinePosition() async {
    try {
      LocationPermission permission;

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }

 static Future<Address?> getCordinates(double latitude, double longitude) async {
    try {
      Address address = await GeoCode()
          .reverseGeocoding(latitude: latitude, longitude: longitude);
          log(address.toString());
      return address;
    } catch (e) {
      log('address return$e'); 
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
