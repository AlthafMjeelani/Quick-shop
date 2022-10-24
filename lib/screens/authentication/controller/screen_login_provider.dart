import 'package:ecommerse/screens/authentication/view/screen_forgetpassword.dart';
import 'package:ecommerse/screens/authentication/view/screen_registration.dart';
import 'package:ecommerse/screens/bottomnavigation/view/bottom_navigation.dart';
import 'package:flutter/material.dart';

class ScreenLoginProvider with ChangeNotifier {
  bool passwordVisibility = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void passWordVisiblity() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  void navigatorLoginToRegister(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ScreenRegistration(),
    ));
  }

  void navigatorLoginToForget(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ScreenForgrtPassword(),
    ));
  }

  String? validator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }

  void userSignIn(context,formKey) {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ScreenBottomNavbar(),
      ));
    }
  }

  void disposeFeildText() {
    passwordController.clear();
    emailController.clear();
  }
}
