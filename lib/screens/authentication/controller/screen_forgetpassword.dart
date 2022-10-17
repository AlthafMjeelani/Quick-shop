import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenForgetPasswordProvider with ChangeNotifier {
  void navigatorForgetToLogin(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ScreenLogin(),
    ));
  }
}
