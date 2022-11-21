import 'dart:developer';

import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:ecommerse/screens/bottomnavigation/view/bottom_navigation.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';
import 'package:flutter/material.dart';

class ScreenSplashProvider with ChangeNotifier {
  Future<void> gotoHome(context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    /*  check token stored or not    */

    final token = await UserSecureStorage.getToken();
    log('get token :$token');

    if (token != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => const ScreenBottomNavbar(),
          ),
          (route) => false);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => ScreenLogin(),
        ),
      );
    }
  }
}
