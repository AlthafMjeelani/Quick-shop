import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    Key? key,
    required this.title,
    required this.discription,
    required this.offer,
  }) : super(key: key);
  final String title;
  final String discription;
  final String offer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyle.kTextBlack16Boldblack,
                ),
                AppSpacing.ksizedBox10,
                Text(
                  discription,
                  style: AppTextStyle.kTextBlack20Sizeblack,
                ),
                 AppSpacing.ksizedBox10,
                Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('Shope Now',
                        style: TextStyle(color: AppColors.kWhiteColor)),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 183, 214, 224).withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$offer%\nOff',
                  style: AppTextStyle.kTextBlack50Sizeblack,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
