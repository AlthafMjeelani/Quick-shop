import 'dart:developer';

import 'package:ecommerse/screens/authentication/service/signin/google_signin_service.dart';
import 'package:ecommerse/screens/bottomnavigation/view/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider with ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;
  void googleSignin() async {
    isLoading = true;
    notifyListeners();
    await GoogleSignInSErvice.googleSignIn(googleSignIn).then((value) {
      if (value != null) {
        log(value.toString());
        Get.offAll(() => const ScreenBottomNavbar());
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        return;
      }
    });
  }
}
