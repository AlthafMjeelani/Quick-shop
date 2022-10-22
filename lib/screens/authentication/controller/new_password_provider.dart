import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:ecommerse/screens/authentication/widget/password_created.dart';
import 'package:flutter/material.dart';

class ScreenNewPasswordProvider with ChangeNotifier {
  void show(context) {
    showDialog(
      context: context,
      builder: (context) {
        return const SuccessDialouge();
      },
    );
  }

  void navigatorForgePop(context) {
    Navigator.of(context).pop();
  }

  void navigatorNewPassToLogin(context) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return const ScreenLogin();
      },
    ), (route) => false);
  }
}
