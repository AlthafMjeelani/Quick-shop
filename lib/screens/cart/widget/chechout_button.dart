import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:flutter/material.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: const BoxDecoration(
       // borderRadius: BorderRadius.circular(),
        color: AppColors.kBlackColor,
      ),
      child: Center(
        child: Row(
          children: [
            AppSpacing.ksizedBoxW20,
            const Text(
              'GO TO CHECKOUT',
              style: AppTextStyle.kLongButtonWite,
            ),
            const Spacer(),
          
            Column(
              children: const [
                AppSpacing.ksizedBox10,
                Text(
                  'Totel Price',
                  style: AppTextStyle.ktextWhite16,
                ),
                Text(
                  '₹5,999',
                  style: AppTextStyle.kLongButtonWite,
                ),
              ],
            ),  AppSpacing.ksizedBoxW20,
          ],
        ),
      ),
    );
  }
}
