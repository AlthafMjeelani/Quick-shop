import 'package:ecommerse/screens/account/controller/screen_account_privider.dart';
import 'package:ecommerse/screens/address/controller/screen_add_address_provider.dart';
import 'package:ecommerse/screens/address/controller/screen_address_provider.dart';
import 'package:ecommerse/screens/allproducts/controller/all_product_provider.dart';
import 'package:ecommerse/screens/authentication/controller/forgot_password_provider.dart';
import 'package:ecommerse/screens/authentication/controller/google_signin_provider.dart';
import 'package:ecommerse/screens/authentication/controller/new_password_provider.dart';
import 'package:ecommerse/screens/authentication/controller/screen_otp_provider.dart';
import 'package:ecommerse/screens/authentication/controller/screen_login_provider.dart';
import 'package:ecommerse/screens/authentication/controller/screen_registration_provider.dart';
import 'package:ecommerse/screens/bottomnavigation/controller/bottom_nav_provider.dart';
import 'package:ecommerse/screens/cart/controller/screen_cart_provider.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/home/view/screen_home.dart';
import 'package:ecommerse/screens/payment/controller/screen_paymentmethode_provider.dart';
import 'package:ecommerse/screens/productdetails/controller/screen_product_details_provider.dart';
import 'package:ecommerse/screens/order/controller/screen_stepper_provider.dart';
import 'package:ecommerse/screens/profile/controller/screen_profile_provider.dart';
import 'package:ecommerse/screens/splash/controller/screen_splash_provider.dart';
import 'package:ecommerse/screens/splash/view/screen_spalsh.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScreenLoginProvider()),
        ChangeNotifierProvider(
            create: (context) => ScreenRegistrationProvider()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => ScreenOtpProvider()),
        ChangeNotifierProvider(create: (context) => ScreenSplashProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => ScreenAllProductProvider()),
        ChangeNotifierProvider(create: (context) => ScreenHomeProvider()),
        ChangeNotifierProvider(
            create: (context) => ScreenProductDetailsProvider()),
        ChangeNotifierProvider(create: (context) => ScreenCartProvider()),
        ChangeNotifierProvider(
            create: (context) => ScreenForgotPasswordProvider()),
        ChangeNotifierProvider(create: (context) => ScreenAccountProvider()),
        ChangeNotifierProvider(create: (context) => ScreenProfileProvider()),
        ChangeNotifierProvider(create: (context) => ScreenAddressProvider()),
        ChangeNotifierProvider(
            create: (context) => ScreenNewPasswordProvider()),
        ChangeNotifierProvider(
            create: (context) => ScreenPaymentMethodeProvider()),
        ChangeNotifierProvider(create: (context) => ScreenStepperProvider()),
        ChangeNotifierProvider(create: (context) => AddAddressProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColorLight: const Color.fromARGB(255, 255, 255, 255)),
        home: const ScreenSplash(),
      ),
    );
  }
}
