import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/screens/authentication/controller/screen_login_provider.dart';
import 'package:ecommerse/screens/authentication/controller/screen_registration_provider.dart';
import 'package:ecommerse/screens/authentication/widget/button_bottom.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScreenRegistration extends StatelessWidget {
  ScreenRegistration({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ScreenRegistrationProvider>(context, listen: false);
    
    return Scaffold(
     extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            data.navigatorRegisterBack(context);
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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.ksizedBox80,
                  Text(
                    'Create Account',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.ksizedBox30,
                  TextfeildWidget(
                    validator: (value) =>
                        data.validator(value, 'Please Enter Name'),
                    controller: data.userNameController,
                    text: 'Full Name',
                    obscureText: false,
                  ),
                  AppSpacing.ksizedBox10,
                  TextfeildWidget(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        EmailValidator.validate(value.toString())
                            ? null
                            : "Please enter a valid email",
                    controller: data.emailController,
                    text: 'Email Address',
                    obscureText: false,
                  ),
                  AppSpacing.ksizedBox10,
                  TextfeildWidget(
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        data.phoneValidator(value, 'Please Enter Phone Number'),
                    controller: data.phoneController,
                    text: 'Phone',
                    obscureText: false,
                  ),
                  AppSpacing.ksizedBox10,
                  Consumer(
                      builder: (context, ScreenLoginProvider value, child) {
                    return TextfeildWidget(
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) =>
                          data.passValidator(value, 'Please Enter Password'),
                      controller: data.passwordController,
                      text: 'Password',
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
                  }),
                  AppSpacing.ksizedBox10,
                  Consumer(
                      builder: (context, ScreenLoginProvider value, child) {
                    return TextfeildWidget(
                      validator: (value) => data.confirmPassValidator(
                          value, 'Please Enter Password'),
                      controller: data.confrPasswordController,
                      text: 'Confirm Password',
                      obscureText: false,
                    );
                  }),
                  AppSpacing.ksizedBox30,
                  Consumer<ScreenRegistrationProvider>(
                    builder: (context, value, child) {
                      return value.isLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : LongButtonWidget(
                              text: 'Sign up',
                              onTap: () async {
                                await value.registerUser(context, formKey);
                              },
                            );
                    },
                  ),
                  AppSpacing.ksizedBox40,
                  ButtonBottomSide(
                    onTap: () {
                      data.navigatorRegisterBack(context);
                    },
                    richText: 'Sign in',
                    text: "Already Have an Account?",
                    height: MediaQuery.of(context).size.height * 0.09,
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
