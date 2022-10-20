import 'package:ecommerse/screens/authentication/view/screen_forgetpassword.dart';
import 'package:ecommerse/screens/authentication/view/screen_registration.dart';
import 'package:ecommerse/screens/bottomnavigation/view/bottom_navigation.dart';
import 'package:flutter/material.dart';

class ScreenLoginProvider with ChangeNotifier {
  bool passwordVisibility = true;

  void passWordVisiblity() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  void navigatorLoginToRegister(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ScreenRegistration(),
    ));
  }

  void navigatorLoginToForget(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ScreenForgrtPassword(),
    ));
  }

  void navigatorLoginTobottomNav(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ScreenBottomNavbar(),
    ));
  }
}
