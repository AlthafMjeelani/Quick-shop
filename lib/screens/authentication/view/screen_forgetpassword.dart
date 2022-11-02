import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/screens/authentication/controller/forgot_password_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class ScreenForgrtPassword extends StatelessWidget {
  ScreenForgrtPassword({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ScreenForgotPasswordProvider>(context, listen: false);
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
                TextfeildWidget(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      EmailValidator.validate(value.toString())
                          ? null
                          : "Please enter a valid email",
                  controller: data.emailController,
                  text: 'email',
                  obscureText: false,
                ),
                AppSpacing.ksizedBox20,
                Consumer<ScreenForgotPasswordProvider>(
                  builder: (context, value, child) {
                    return value.isLoading == true
                        ? const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : LongButtonWidget(
                            text: 'Find Your Email',
                            onTap: () {
                              data.navigatorToOtp(formKey);
                            },
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
