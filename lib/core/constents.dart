import 'package:flutter/material.dart';

class ConstentsItems {
  static const ksizedBox5 = SizedBox(height: 5);
  static const ksizedBox10 = SizedBox(height: 10);
  static const ksizedBox20 = SizedBox(height: 20);
  static const ksizedBox50 = SizedBox(height: 50);
  static const ksizedBox200 = SizedBox(height: 200);
  static const ksizedBoxW10 = SizedBox(width: 10);
  static const kBlackColor = Colors.black;
  static const kWhiteColor = Colors.white;
  static const kWhiteBlue = Colors.blue;
  static const kTextBlack = TextStyle(color: Colors.black, fontSize: 18);
  static const kTextBlackLargeSize =
      TextStyle(color: Colors.black, fontSize: 20);
  static const kLongButton =
      TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
  static const kTextsize16 = TextStyle(fontSize: 16);
  static const double kIconsize32 = 32;
  static const kBgColor = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white,
      Color.fromARGB(255, 255, 255, 255),
    ],
  );
  static const kTextBlack20Size =
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  static const kTextBlack50Size =
      TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold);
  static const kTextBlack40Size =
      TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold);
  static const kTextSize18Black =
      TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
  static const kPriceColor =
      TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold);
  static const kTextsizecrossLine =
      TextStyle(decoration: TextDecoration.lineThrough, fontSize: 18);
}
