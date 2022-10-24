import 'dart:async';
import 'package:ecommerse/screens/authentication/model/sign_up/sign_up_model.dart';
import 'package:ecommerse/screens/authentication/model/sign_up/verify_otp_model.dart';
import 'package:ecommerse/screens/authentication/service/signup/verify_otp_service.dart';
import 'package:ecommerse/screens/authentication/view/screen_otp.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/material.dart';

class ScreenOtpProvider with ChangeNotifier {
  final bool isLoading = false;

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

  void submitOtp(
    BuildContext context,
    UserModel model,
  ) async {
    if (code.length != 4) {
      await AppPopUps.showToast("Enter Otp", Colors.red);
    } else {
      final verifyOtp = UserVerifyOtpModel(
        code: code,
        email: model.email,
        password: model.password,
        phone: model.phone,
        username: model.username,
      );

      await VerifyotpService.signUpVerifyOtp(verifyOtp, context, isLoading);
    }
    notifyListeners();
  }

  void navigatorForgetToOtp(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ScreenOtp(otpNumber: '8086689484'),
    ));
  }
}
