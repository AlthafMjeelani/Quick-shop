import 'dart:async';

import 'package:ecommerse/screens/authentication/view/screen_forget_otp.dart';
import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:flutter/material.dart';

class ScreenForgetPasswordProvider with ChangeNotifier {
  void navigatorForgetToLogin(context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const ScreenLogin(),
    ));
  }

  void navigatorForgetotpPop(context) {
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
    // await AppPopUps.showToast("Otp verified", AppColors.successColor);
    Navigator.pop(context);
  }

  void navigatorForgetToOtp(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ScreenOtp(),
    ));
  }
}
