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
}
