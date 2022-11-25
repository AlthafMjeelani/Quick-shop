import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomNotFoundWidget extends StatelessWidget {
  const CustomNotFoundWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        height: size.height * 0.4,
        width: size.width * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              child: Lottie.asset(
                'assets/lottie/no data.json',
                fit: BoxFit.fill,
              ),
            ),
            AppSpacing.ksizedBox5,
            Text(
              title,
              style: AppTextStyle.kTextBlack16Bold,
              textAlign: TextAlign.center,
            ),
            AppSpacing.ksizedBox10,
            Text(
              subtitle,
              //style: AppTextStyle.subtitle2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
