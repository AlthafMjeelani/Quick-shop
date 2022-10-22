import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:flutter/material.dart';

class ScreenRegistrationProvider with ChangeNotifier {
  void navigatorRegisterBack(context) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return const ScreenLogin();
      },
    ), (route) => false);
  }
}
