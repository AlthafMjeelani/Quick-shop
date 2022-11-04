import 'dart:developer';

import 'package:ecommerse/screens/authentication/model/enum/otp_enum_model.dart';
import 'package:ecommerse/screens/authentication/service/forgotpassword/forgot_password_service.dart';
import 'package:ecommerse/screens/authentication/view/screen_otp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenForgotPasswordProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  void navigatorToOtp(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      await ForgetPasswordServices.getOtp(emailController.text).then((value) {
        if (value != null) {
          Get.to(
            ScreenOtp(
              otpEmail: emailController.text,
              type: Actiontype.forgetPassword,
            ),
          );
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
          log('called');
          return;
        }
      });
    }
  }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Email ';
    }
    return EmailValidator.validate(value.toString())
        ? null
        : "Please enter a valid email";
  }
}
