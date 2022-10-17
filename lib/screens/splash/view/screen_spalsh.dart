import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:ecommerse/screens/splash/controller/screen_splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ScreenSplashProvider>(context, listen: false).gotoHome(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 101, 153, 231),
              Color.fromARGB(255, 124, 239, 250)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/shopping_cart-removebg-preview.png'),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ],
        ),
      ),
    );
  }
}
