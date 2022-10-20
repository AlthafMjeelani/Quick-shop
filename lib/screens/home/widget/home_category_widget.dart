import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:flutter/material.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/shirtimage.png'),
            ),
            AppSpacing.ksizedBox20,
            Text(
              'Shirts',
              style: AppTextStyle.kTextSize18Black,
            )
          ],
        ),
        Column(
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/t shirt.jpg'),
            ),
            AppSpacing.ksizedBox20,
            Text(
              'T Shirts',
              style: AppTextStyle.kTextSize18Black,
            )
          ],
        ),
        Column(
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/pands.png'),
            ),
            AppSpacing.ksizedBox20,
            Text(
              'Pants',
              style: AppTextStyle.kTextSize18Black,
            ),
          ],
        ),
        Column(
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                'assets/images/track.webp',
              ),
            ),
            AppSpacing.ksizedBox20,
            Text(
              'Track Shorts',
              style: AppTextStyle.kTextSize18Black,
            ),
          ],
        ),
      ],
    );
  }
}
