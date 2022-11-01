import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/screens/authentication/controller/forgot_password_provider.dart';
import 'package:ecommerse/screens/authentication/controller/new_password_provider.dart';
import 'package:ecommerse/screens/authentication/controller/screen_otp_provider.dart';
import 'package:ecommerse/screens/authentication/model/forgotpassword/forgot_password_model.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class ScreenNewPassword extends StatelessWidget {
  ScreenNewPassword({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final newPassword =
        Provider.of<ScreenNewPasswordProvider>(context, listen: false);
    final forgetPassword =
        Provider.of<ScreenForgotPasswordProvider>(context, listen: false);
    final otpController =
        Provider.of<ScreenOtpProvider>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlackColor,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.kBgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context, ScreenNewPasswordProvider data, child) {
                    return TextfeildWidget(
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          data.passValidator(value, 'Please Enter Password'),
                      controller: data.passwordController,
                      text: 'Password',
                      obscureText: data.passwordVisibility,
                      suffixIcon: IconButton(
                        icon: Icon(
                          data.passwordVisibility
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.kBlackColor,
                        ),
                        onPressed: () {
                          data.passWordVisiblity();
                        },
                      ),
                    );
                  },
                ),
                AppSpacing.ksizedBox10,
                TextfeildWidget(
                    validator: (value) => newPassword.confirmPassValidator(
                        value, "Password Doesn't match"),
                    text: 'Conform Password',
                    obscureText: false),
                AppSpacing.ksizedBox20,
                LongButtonWidget(
                  text: 'SAVE',
                  onTap: () {
                    final newPsswordModel = SaveNewPasswordModel(
                      email: forgetPassword.emailController.text,
                      password: newPassword.passwordController.text,
                      code: otpController.code,
                    );
                    newPassword.submitnewPassword(
                      context,
                      formKey,
                      newPsswordModel,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
