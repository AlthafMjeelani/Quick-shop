import 'package:ecommerse/screens/authentication/model/signin/sign_in_model.dart';
import 'package:ecommerse/screens/authentication/service/signin/sign_in_service.dart';
import 'package:ecommerse/screens/authentication/view/screen_forgetpassword.dart';
import 'package:ecommerse/screens/authentication/view/screen_registration.dart';
import 'package:flutter/material.dart';

class ScreenLoginProvider with ChangeNotifier {
  bool passwordVisibility = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void passWordVisiblity() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  void navigatorLoginToRegister(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ScreenRegistration(),
    ));
  }

  void navigatorLoginToForget(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ScreenForgrtPassword(),
    ));
  }

  String? validator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }

  void userSignIn(context, formKey) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      final signInUser = SignInModel(
        email: emailController.text,
        password: passwordController.text,
      );

      await SignInService.signUpService(signInUser, context);
      isLoading = false;
    }
    notifyListeners(); 
  }

  void disposeFeildText() {
    passwordController.clear();
    emailController.clear();
  }
}
