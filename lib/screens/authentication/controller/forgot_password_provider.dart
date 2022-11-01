import 'package:ecommerse/screens/authentication/model/enum/otp_enum_model.dart';
import 'package:ecommerse/screens/authentication/view/screen_otp.dart';
import 'package:ecommerse/screens/authentication/widget/password_created.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenForgotPasswordProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  void show(context) {
    showDialog(
      context: context,
      builder: (context) {
        return const SuccessDialouge();
      },
    );
  }

  void navigatorToOtp() {
    Get.to(
      const ScreenOtp(
        otpEmail: '',
        type: Actiontype.forgetPassword,
      ),
    );
  }
}
