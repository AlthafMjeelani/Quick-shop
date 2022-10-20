import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:flutter/material.dart';

class ScreenSplashProvider with ChangeNotifier {
  Future<void> gotoHome(context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const ScreenLogin(),
      ),
    );
  }
}
