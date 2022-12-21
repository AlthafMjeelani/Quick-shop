import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/authentication/controller/screen_login_provider.dart';
import 'package:ecommerse/screens/authentication/view/screen_forgetpassword.dart';
import 'package:ecommerse/screens/authentication/view/screen_registration.dart';
import 'package:ecommerse/screens/authentication/widget/button_bottom.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenLoginProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.kBgColor,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.17,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login to your\nAccount',
                        style: GoogleFonts.poppins(
                          letterSpacing: 1,
                          fontSize: 42,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.ksizedBox30,
                  TextfeildWidget(
                    keyboardType: TextInputType.emailAddress,
                    controller: data.emailController,
                    validator: (value) => data.emailValidation(value),
                    text: 'Enter Email Id',
                    obscureText: false,
                  ),
                  AppSpacing.ksizedBox10,
                  Consumer(
                    builder: (context, ScreenLoginProvider value, child) {
                      return TextfeildWidget(
                        controller: data.passwordController,
                        validator: (value) =>
                            data.validator(value, 'Please Enter Password'),
                        text: 'Enter Password',
                        keyboardType: TextInputType.text,
                        obscureText: value.passwordVisibility,
                        suffixIcon: IconButton(
                          icon: Icon(
                            value.passwordVisibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.kBlackColor,
                          ),
                          onPressed: () {
                            value.passWordVisiblity();
                          },
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(ScreenForgrtPassword());
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: AppTextStyle.kTextwhite16,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.ksizedBox10,
                  Consumer<ScreenLoginProvider>(
                    builder: (context, value, child) {
                      return value.isLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : LongButtonWidget(
                              text: 'Sign in',
                              onTap: () {
                                data.userSignIn(context, formKey);
                              },
                            );
                    },
                  ),
                  AppSpacing.ksizedBox40,
                  ButtonBottomSide(
                    onTap: () {
                      Get.to(
                        () => ScreenRegistration(),
                      );
                    },
                    richText: 'Sign up',
                    text: "Don't Have an Account?",
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
