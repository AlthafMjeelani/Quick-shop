import 'dart:async';

import 'package:ecommerse/screens/authentication/view/screen_forget_otp.dart';
import 'package:ecommerse/screens/authentication/view/screen_new_password.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/material.dart';

class ScreenForgetPasswordProvider with ChangeNotifier {
  void navigatorForgetToNewPassword(context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const ScreenNewPassword(),
    ));
  }

  void navigatorForgePop(context) {
    Navigator.of(context).pop();
  }

  int timeRemaining = 30;
  Timer? timer;
  bool enableResend = false;

  String code = '';

  void setCode(String newCode) {
    code = newCode;
    notifyListeners();
  }

  void setResendVisibility(bool newValue) {
    enableResend = newValue;
    timeRemaining = 30;
    notifyListeners();
  }

  void changeTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timeRemaining != 0) {
        timeRemaining--;
        notifyListeners();
      } else {
        enableResend = true;
        notifyListeners();
      }
    });
  }

  void submitOtp(BuildContext context) async {
    if (code.length != 4) {
      return;
    }
    await AppPopUps.showToast("Otp verified", Colors.green);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  void navigatorForgetToOtp(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ScreenOtp(),
    ));
  }
}
