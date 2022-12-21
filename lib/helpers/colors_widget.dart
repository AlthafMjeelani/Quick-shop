import 'package:flutter/material.dart';

class AppColors {
  static const kBlackColor = Colors.black;
  static const kWhiteColor = Colors.white;
  static const kBlueColor = Colors.blue;
  static const kBgColor = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 38, 36, 36),
      Color.fromARGB(255, 39, 37, 37),
    ],
  );
}
