import 'package:ecommerse/screens/profile/view/screen_profile.dart';
import 'package:flutter/material.dart';

class ScreenAccountProvider with ChangeNotifier {
  void navogationToProfile(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ScreenProfile(),
      ),
    );
  }
}
