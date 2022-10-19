import 'package:ecommerse/core/constents.dart';
import 'package:ecommerse/screens/authentication/controller/screen_forgetpassword.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenForgrtPassword extends StatelessWidget {
  const ScreenForgrtPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ScreenForgetPasswordProvider>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            data.navigatorForgetToLogin(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ConstentsItems.kBlackColor,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: ConstentsItems.kBgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextfeildWidget(text: 'email/phone', obscureText: false),
              ConstentsItems.ksizedBox20,
              LongButtonWidget(
                text: 'Continue',
                onTap: () {
                  data.navigatorForgetToOtp(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
