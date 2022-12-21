import 'package:ecommerse/screens/address/view/screen_address.dart';
import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:ecommerse/screens/profile/view/screen_profile.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ScreenAccountProvider with ChangeNotifier {
  void navigationToProfile(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ScreenProfile(),
      ),
    );
  }

  void navigationToAdress(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ScreenAddress(),
      ),
    );
  }

    void logOut(context) async {

    GoogleSignIn googleSignIn=GoogleSignIn();
    /* token  set as NULL  into secure storage   */

    await UserSecureStorage.setToken(null);
    await googleSignIn.signOut();

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return ScreenLogin();
      },
    ), (route) => false);
  }
}
