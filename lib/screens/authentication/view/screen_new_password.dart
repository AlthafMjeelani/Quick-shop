import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/screens/authentication/controller/forgot_password_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class ScreenNewPassword extends StatelessWidget {
  const ScreenNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final otpController =
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextfeildWidget(text: 'New Password', obscureText: false),
              AppSpacing.ksizedBox10,
              const TextfeildWidget(
                  text: 'Conform Password', obscureText: false),
              AppSpacing.ksizedBox20,
              LongButtonWidget(
                text: 'SAVE',
                onTap: () {
                  otpController.show(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
