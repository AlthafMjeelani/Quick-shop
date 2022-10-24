import 'package:ecommerse/screens/address/view/screen_addaddress.dart';
import 'package:flutter/material.dart';

class ScreenAddressProvider with ChangeNotifier {
  void popPage(context) {
    Navigator.pop(context);
  }

  void navigationToAddAdress(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ScreenAddAddress(),
      ),
    );
  }
}
