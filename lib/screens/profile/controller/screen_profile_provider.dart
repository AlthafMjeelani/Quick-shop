import 'package:ecommerse/screens/profile/view/screen_change_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenProfileProvider with ChangeNotifier {
  void popPage(context) {
    Navigator.pop(context);
  }

  void navogationToChangePassword(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ScreenChangePassword(),
      ),
    );
  }
}
