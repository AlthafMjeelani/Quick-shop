import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:flutter/material.dart';

class ScreenRegistrationProvider with ChangeNotifier {
  void navigatorRegisterBack(context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const ScreenLogin(),
    ));
  }
}
