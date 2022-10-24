import 'package:ecommerse/screens/authentication/model/sign_up/sign_up_model.dart';
import 'package:ecommerse/screens/authentication/service/signup/sign_up_service.dart';
import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:flutter/material.dart';

class ScreenRegistrationProvider with ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confrPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final bool isLoading = false;

  void navigatorRegisterBack(context) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return ScreenLogin();
      },
    ), (route) => false);
  }

  Future<void> registerUser(context, formKey) async {
    if (formKey.currentState!.validate()) {
      final user = UserModel(
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        username: userNameController.text,
      );

      await SignUpApiService.signUpService(
          user, context, phoneController.text, isLoading);
    }
    notifyListeners();
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

  void disposeFeild() {
    userNameController.clear();
    passwordController.clear();
    confrPasswordController.clear();
    phoneController.clear();
    emailController.clear();
  }
}
