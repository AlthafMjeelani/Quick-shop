import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/cart/controller/screen_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        color: AppColors.kWhiteColor,
      ),
      child: Consumer(builder: (context, ScreenCartProvider value, child) {
        return Center(
          child: Row(
            children: [
              AppSpacing.ksizedBoxW20,
              Column(
                children: [
                  AppSpacing.ksizedBox10,
                  const Text(
                    'Totel Price',
                    style: AppTextStyle.kTextBlack16,
                  ),
                  Text(
                    '₹${value.totalPrice.round()}',
                    style: AppTextStyle.kLongButtonBlack,
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                'GO TO CHECKOUT',
                style: AppTextStyle.kLongButtonBlack,
              ),
              AppSpacing.ksizedBoxW20,
            ],
          ),
        );
      }),
    );
  }
}
