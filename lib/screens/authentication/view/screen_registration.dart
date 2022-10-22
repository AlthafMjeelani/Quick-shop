import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/screens/authentication/controller/screen_login_provider.dart';
import 'package:ecommerse/screens/authentication/controller/screen_registration_provider.dart';
import 'package:ecommerse/screens/authentication/widget/button_bottom.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScreenRegistration extends StatelessWidget {
  const ScreenRegistration({super.key});

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.ksizedBox80,
                Text(
                  'Sign up',
                  style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                AppSpacing.ksizedBox50,
                const TextfeildWidget(
                  text: 'Full Name',
                  obscureText: false,
                ),
                AppSpacing.ksizedBox10,
                const TextfeildWidget(
                  text: 'Email Address',
                  obscureText: false,
                ),
                AppSpacing.ksizedBox10,
                Consumer(builder: (context, ScreenLoginProvider value, child) {
                  return TextfeildWidget(
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
                Consumer(builder: (context, ScreenLoginProvider value, child) {
                  return const TextfeildWidget(
                    text: 'Conform Password',
                    obscureText: false,
                  );
                }),
                AppSpacing.ksizedBox20,
                LongButtonWidget(
                  text: 'Sign up',
                  onTap: () {},
                ),
                AppSpacing.ksizedBox40,
                ButtonBottomSide(
                  onTap: () {
                    data.navigatorRegisterBack(context);
                  },
                  richText: 'Sign in',
                  text: "Already Have an Account?",
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
