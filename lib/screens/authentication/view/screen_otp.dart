import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/authentication/controller/screen_reg_otp_provider.dart';
import 'package:ecommerse/screens/authentication/controller/screen_registration_provider.dart';
import 'package:ecommerse/screens/authentication/model/sign_up/sign_up_model.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class ScreenOtp extends StatefulWidget {
  const ScreenOtp({
    super.key,
    required this.otpNumber,
  });

  final String otpNumber;
  @override
  State<ScreenOtp> createState() => _ScreenOtpState();
}

class _ScreenOtpState extends State<ScreenOtp> {
  late ScreenOtpProvider otpController;
  late ScreenRegistrationProvider signUpController;
  @override
  void initState() {
    otpController = Provider.of<ScreenOtpProvider>(context, listen: false);
    signUpController =
        Provider.of<ScreenRegistrationProvider>(context, listen: false);
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
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlackColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSpacing.ksizedBox130,
                Text("Code has been sent to +91${widget.otpNumber}"),
                AppSpacing.ksizedBox50,
                OtpTextField(
                  numberOfFields: 4,
                  showFieldAsBox: true,
                  autoFocus: true,
                  borderColor: AppColors.kBlackColor,
                  disabledBorderColor: AppColors.kBlackColor,
                  enabledBorderColor: AppColors.kBlackColor,
                  cursorColor: AppColors.kBlackColor,
                  focusedBorderColor: AppColors.kBlueColor,
                  borderWidth: 1.5,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  fieldWidth: 60.0,
                  onSubmit: (String code) {
                    otpController.setCode(code);
                  },
                ),
                AppSpacing.ksizedBox20,
                Consumer<ScreenOtpProvider>(
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
                AppSpacing.ksizedBox40,
                Consumer<ScreenOtpProvider>(
                  builder: (context, value, child) {
                    return value.isLoading
                        ? const CircularProgressIndicator(
                            strokeWidth: 2,
                          )
                        : LongButtonWidget(
                            text: 'Verify',
                            onTap: () {
                              final userModal = UserModel(
                                  email: signUpController.emailController.text,
                                  password:
                                      signUpController.passwordController.text,
                                  phone: signUpController.phoneController.text,
                                  username:
                                      signUpController.userNameController.text);
                              otpController.submitOtp(context, userModal);
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
