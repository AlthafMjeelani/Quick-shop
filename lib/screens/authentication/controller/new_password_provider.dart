import 'dart:developer';

import 'package:ecommerse/screens/authentication/model/forgotpassword/forgot_password_model.dart';
import 'package:ecommerse/screens/authentication/service/forgotpassword/save_new_password_service.dart';
import 'package:ecommerse/screens/authentication/widget/password_created.dart';
import 'package:flutter/material.dart';

class ScreenNewPasswordProvider with ChangeNotifier {
  bool passwordVisibility = true;
  final TextEditingController confrPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void passWordVisiblity() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
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

  void submitnewPassword(TextEditingController controller, context,
      GlobalKey<FormState> formKey, SaveNewPasswordModel model) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      await SaveNewpasswordService.saveNewPassword(model).then(
        (value) async {
          if (value != null) {
            log('if called Ok');
            await showDialog(
              context: context,
              builder: (context) {
                return const SuccessDialouge();
              },
            );
            passwordController.clear();
            confrPasswordController.clear();
            controller.clear();
            isLoading = false;
            notifyListeners();
          } else {
            isLoading = false;
            notifyListeners();
            return;
          }
        },
      );
    }
  }
}
