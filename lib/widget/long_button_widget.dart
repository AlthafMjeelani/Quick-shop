import 'package:ecommerse/core/constents.dart';
import 'package:flutter/material.dart';

class LongButtonWidget extends StatelessWidget {
  const LongButtonWidget({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: ConstentsItems.KBlackColor,
        ),
        child: Center(
          child: Text(
            text,
            style: ConstentsItems.kLongButton,
          ),
        ),
      ),
    );
  }
}
