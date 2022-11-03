import 'dart:async';
import 'dart:developer';
import 'package:ecommerse/screens/authentication/controller/screen_registration_provider.dart';
import 'package:ecommerse/screens/authentication/model/enum/otp_enum_model.dart';
import 'package:ecommerse/screens/authentication/model/forgotpassword/forgot_otp_verification_model.dart';
import 'package:ecommerse/screens/authentication/model/sign_up/sign_up_model.dart';
import 'package:ecommerse/screens/authentication/model/sign_up/verify_otp_model.dart';
import 'package:ecommerse/screens/authentication/service/forgotpassword/otp_verification_service.dart';
import 'package:ecommerse/screens/authentication/service/signup/verify_otp_service.dart';
import 'package:ecommerse/screens/authentication/view/screen_new_password.dart';
import 'package:ecommerse/screens/bottomnavigation/view/bottom_navigation.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenOtpProvider with ChangeNotifier {
  UserVerifyOtpModel? userVerifyOtpModel;
  bool isLoading = false;
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
      UserModel? model,
      Actiontype type,
      TextEditingController emailController,
      ScreenRegistrationProvider signUpController) async {
    if (code.length != 4) {
      await AppPopUps.showToast("Enter Otp", Colors.red);
    } else if (type == Actiontype.forgetPassword) {
      isLoading = true;
      notifyListeners();

      final otpModel = ForgotOtpVerifyModel(
        email: emailController.text,
        otp: code,
      );
      await ForgetPasswordOtpverificationServices.forgetPasswordOtpverification(
              otpModel)
          .then(
        (value) {
          if (value != null) {
            log('called');
            Get.off(
              () => ScreenNewPassword(),
            );
          }
        },
      );
      isLoading = false;
      notifyListeners();
    } else if (type == Actiontype.register) {
      isLoading = true;
      notifyListeners();
      final verifyOtp = UserVerifyOtpModel(
        email: model?.email,
        password: model?.password,
        phone: model?.phone,
        userName: model?.username,
      );
      userVerifyOtpModel =
          await VerifyotpService.signUpVerifyOtp(verifyOtp, code);

      if (userVerifyOtpModel != null) {
        AppPopUps.showToast('Created Successfully', Colors.green);
        Get.offAll(() => const ScreenBottomNavbar());
        isLoading = false;
        notifyListeners();
        signUpController.disposeFeild();
      } else {
        log('return called');
        isLoading = false;
        notifyListeners();
        return;
      }
    }
  }
}
