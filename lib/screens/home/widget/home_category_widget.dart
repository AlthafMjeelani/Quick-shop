import 'package:ecommerse/core/constents.dart';
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
            ConstentsItems.ksizedBox20,
            Text(
              'Shirts',
              style: ConstentsItems.kTextSize18Black,
            )
          ],
        ),
        Column(
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/t shirt.jpg'),
            ),
            ConstentsItems.ksizedBox20,
            Text(
              'T Shirts',
              style: ConstentsItems.kTextSize18Black,
            )
          ],
        ),
        Column(
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/pands.png'),
            ),
            ConstentsItems.ksizedBox20,
            Text(
              'Pants',
              style: ConstentsItems.kTextSize18Black,
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
            ConstentsItems.ksizedBox20,
            Text(
              'Track Shorts',
              style: ConstentsItems.kTextSize18Black,
            ),
          ],
        ),
      ],
    );
  }
}
