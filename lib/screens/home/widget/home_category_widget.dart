import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:flutter/material.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 40,
          backgroundImage: AssetImage(image),
        ),
        AppSpacing.ksizedBox20,
        Text(
          title,
          style: AppTextStyle.kTextSize18Black,
        )
      ],
    );
  }
}
