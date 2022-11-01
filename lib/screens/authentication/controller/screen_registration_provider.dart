import 'dart:developer';
import 'package:ecommerse/screens/authentication/model/enum/otp_enum_model.dart';
import 'package:ecommerse/screens/authentication/model/sign_up/sign_up_model.dart';
import 'package:ecommerse/screens/authentication/service/signup/sign_up_service.dart';
import 'package:ecommerse/screens/authentication/view/screen_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenRegistrationProvider with ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confrPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  Future<void> registerUser(context, GlobalKey<FormState> formKey) async {
    log('called register function');
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final user = UserModel(
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        username: userNameController.text,
      );
      await SignUpApiService.signUpService(user, phoneController.text)
          .then((value) {
        if (value != null) {
          Get.to(
            () => ScreenOtp(
              otpEmail: emailController.text,
              type: Actiontype.register,
            ),
          );
        } else {
          return;
        }
      });
      // disposeFeild();
      isLoading = false;
      notifyListeners();
    }
  }

  String? validator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }

  String? passValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    if (value.length < 6) {
      return 'Please Enter Minimum 6 Cheracter';
    }
    return null;
  }

  String? confirmPassValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    if (value != passwordController.text) {
      return "Password Doesn't match";
    }
    return null;
  }

  String? phoneValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    if (value.length != 10) {
      return "Please Enter 10 Numbers";
    }
    return null;
  }

  // void disposeFeild() {
  //   userNameController.clear();
  //   passwordController.clear();
  //   confrPasswordController.clear();
  //   phoneController.clear();
  //   emailController.clear();
  // }
}
