import 'package:ecommerse/screens/address/view/screen_addresslist.dart';
import 'package:ecommerse/screens/profile/view/screen_profile.dart';
import 'package:flutter/material.dart';

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
}
