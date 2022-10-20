import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/authentication/controller/screen_forgetpassword.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class ScreenOtp extends StatefulWidget {
  const ScreenOtp({super.key});

  @override
  State<ScreenOtp> createState() => _ScreenOtpState();
}

class _ScreenOtpState extends State<ScreenOtp> {
  late ScreenForgetPasswordProvider otpController;
  @override
  void initState() {
    otpController =
        Provider.of<ScreenForgetPasswordProvider>(context, listen: false);
    otpController.changeTimer();
    super.initState();
  }

  @override
  void dispose() {
    otpController.timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            otpController.navigatorForgePop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlackColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppSpacing.ksizedBox50,
                  const Text("Code has been sent to +91 9999999999"),
                  AppSpacing.ksizedBox50,
                  OtpTextField(
                    numberOfFields: 4,
                    showFieldAsBox: true,
                    autoFocus: true,
                    borderColor: AppColors.kBlackColor,
                    disabledBorderColor: AppColors.kBlackColor,
                    enabledBorderColor: AppColors.kBlackColor,
                    cursorColor: AppColors.kBlackColor,
                    focusedBorderColor: AppColors.kWhiteBlue,
                    borderWidth: 1.5,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    fieldWidth: 60.0,
                    onSubmit: (String code) {
                      otpController.setCode(code);
                    },
                  ),
                  AppSpacing.ksizedBox50,
                  Consumer<ScreenForgetPasswordProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return value.timeRemaining != 0
                          ? Text("Resend code in ${value.timeRemaining} s")
                          : TextButton(
                              onPressed: () {
                                value.setResendVisibility(false);
                              },
                              child: const Text(
                                "Resend OTP",
                                style: AppTextStyle.kTextsize16,
                              ),
                            );
                    },
                  ),
                  AppSpacing.ksizedBox50,
                  LongButtonWidget(
                    text: 'Verify',
                    onTap: () {
                      otpController.navigatorForgetToNewPassword(context);
                    },
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
