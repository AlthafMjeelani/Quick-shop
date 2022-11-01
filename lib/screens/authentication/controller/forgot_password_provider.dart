import 'dart:developer';

import 'package:ecommerse/screens/authentication/model/enum/otp_enum_model.dart';
import 'package:ecommerse/screens/authentication/service/forgotpassword/forgot_password_service.dart';
import 'package:ecommerse/screens/authentication/view/screen_otp.dart';
import 'package:ecommerse/screens/authentication/widget/password_created.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenForgotPasswordProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  void navigatorToOtp(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      await ForgetPasswordServices.getOtp(emailController.text).then((value) {
        if (value != null) {
          Get.to(
            ScreenOtp(
              otpEmail: emailController.text,
              type: Actiontype.forgetPassword,
            ),
          );
        } else {
          log('called');
        }
      });
    }
  }
}
