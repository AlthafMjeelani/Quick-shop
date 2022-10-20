import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/authentication/controller/screen_login_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenLoginProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.kBgColor,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSpacing.ksizedBox200,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: GoogleFonts.poppins(
                          fontSize: 42, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                AppSpacing.ksizedBox20,
                const TextfeildWidget(
                  text: 'Email',
                  obscureText: false,
                ),
                AppSpacing.ksizedBox10,
                Consumer(builder: (context, ScreenLoginProvider value, child) {
                  return TextfeildWidget(
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
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        data.navigatorLoginToForget(context);
                      },
                      child: const Text(
                        'Forget Password?',
                        style: AppTextStyle.kTextBlack,
                      ),
                    ),
                  ],
                ),
                AppSpacing.ksizedBox10,
                LongButtonWidget(
                  text: 'Login',
                  onTap: () {
                    data.navigatorLoginTobottomNav(context);
                  },
                ),
                AppSpacing.ksizedBox50,
                SignInButton(
                  buttonType: ButtonType.google,
                  buttonSize: ButtonSize.large, // small(default), medium, large
                  onPressed: () {},
                ),
                AppSpacing.ksizedBox20,
                Row(
                  children: const [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                    )),
                    SizedBox(
                      width: 40,
                      child: Center(child: Text('OR')),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                AppSpacing.ksizedBox20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't Have an Account?"),
                    TextButton(
                      onPressed: () {
                        data.navigatorLoginToRegister(context);
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
