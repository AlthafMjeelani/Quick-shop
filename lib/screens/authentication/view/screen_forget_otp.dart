import 'package:ecommerse/core/constents.dart';
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
            otpController.navigatorForgetotpPop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ConstentsItems.kBlackColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstentsItems.ksizedBox50,
                  const Text("Code has been sent to +91 9999999999"),
                  ConstentsItems.ksizedBox50,
                  OtpTextField(
                    numberOfFields: 4,
                    showFieldAsBox: true,
                    autoFocus: true,
                    borderColor: ConstentsItems.kBlackColor,
                    disabledBorderColor: ConstentsItems.kBlackColor,
                    enabledBorderColor: ConstentsItems.kBlackColor,
                    cursorColor: ConstentsItems.kBlackColor,
                    focusedBorderColor: ConstentsItems.kWhiteBlue,
                    borderWidth: 1.5,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    fieldWidth: 60.0,
                    onSubmit: (String code) {
                      otpController.setCode(code);
                    },
                  ),
                  ConstentsItems.ksizedBox50,
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
                                style: ConstentsItems.kTextsize16,
                              ),
                            );
                    },
                  ),
                  ConstentsItems.ksizedBox50,
                  LongButtonWidget(
                    text: 'Verify',
                    onTap: () {
                      otpController.navigatorForgetToLogin(context);
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
