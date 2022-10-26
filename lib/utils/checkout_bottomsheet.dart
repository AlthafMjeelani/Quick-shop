import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/row_twoitem_widget.dart';
import 'package:flutter/material.dart';

class CheckOutBottomSheet {
  static void checkOut(context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                RowTowItemWidget(
                  title1: const Text(
                    'Check Out',
                    style: AppTextStyle.kLongButtonBlack,
                  ),
                  title2: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.kBlackColor,
                    ),
                  ),
                ),
                AppSpacing.ksizedBox20,
                const RowTowItemWidget(
                  title1: Text(
                    'Delivery Fee',
                    style: AppTextStyle.kTextBlack16,
                  ),
                  title2: Text(
                    '₹50',
                    style: AppTextStyle.kTextBlack20Size,
                  ),
                ),
                AppSpacing.ksizedBox5,
                const RowTowItemWidget(
                  title1: Text(
                    'Discount price',
                    style: AppTextStyle.kTextBlack16,
                  ),
                  title2: Text(
                    '₹500',
                    style: AppTextStyle.kTextBlack20Size,
                  ),
                ),
                AppSpacing.ksizedBox5,
                const RowTowItemWidget(
                  title1: Text(
                    'Totel price',
                    style: AppTextStyle.kTextBlack16,
                  ),
                  title2: Text(
                    '₹2,500',
                    style: AppTextStyle.kTextBlack20Size,
                  ),
                ),
                AppSpacing.ksizedBox20,
                LongButtonWidget(
                  text: 'PLACE ORDER',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
