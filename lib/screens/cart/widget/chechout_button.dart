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
    // final cartController =
    //     Provider.of<ScreenCartProvider>(context, listen: false);
    return Container(
      height: 65,
      width: double.infinity,
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(),
        color: AppColors.kBlackColor,
      ),
      child: Consumer(builder: (context,ScreenCartProvider value, child) {
        return Center(
          child: Row(
            children: [
              AppSpacing.ksizedBoxW20,
              const Text(
                'GO TO CHECKOUT',
                style: AppTextStyle.kLongButtonWite,
              ),
              const Spacer(),
              Column(
                children: [
                  AppSpacing.ksizedBox10,
                  const Text(
                    'Totel Price',
                    style: AppTextStyle.ktextWhite16,
                  ),
                  Text(
                    '₹${value.totalPrice.round()}',
                    style: AppTextStyle.kLongButtonWite,
                  ),
                ],
              ),
              AppSpacing.ksizedBoxW20,
            ],
          ),
        );
      }),
    );
  }
}
