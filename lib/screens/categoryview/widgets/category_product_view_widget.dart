
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryProductListWidget extends StatelessWidget {
  const CategoryProductListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                 'assets/images/t shirt.jpg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      // data.isFaved(index);
                    },
                    child:
                        // Consumer(
                        //   builder: (BuildContext context,
                        //       ScreenHomeProvider value, Widget? child) {
                        //     return
                        //   },
                        // ),
                        const Icon(
                      CupertinoIcons.heart_fill,
                      size: AppTextStyle.kIconsize32,
                      color: Colors.grey,
                      // color: value.favoriteBoolList[index]
                      //     ? Colors.red
                      //     : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            AppSpacing.ksizedBox10,
            const Text(
              'Name Of product',
              style: AppTextStyle.kTextBlack16Bold,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '₹899',
                    style: AppTextStyle.kTextsizecrossLineSmall,
                  ),
                  AppSpacing.ksizedBoxW5,
                  Text(
                    '₹1299',
                    style: AppTextStyle.kTextBlack20Size,
                  ),
                  AppSpacing.ksizedBoxW5,
                  Text(
                    '25% off',
                    style: AppTextStyle.kPriceColorSmall,
                  ),
                ],
              ),
            ),
            // Text(
            //   '₹${product.price}',
            //   style: AppTextStyle.kTextBlack20Size,
            // ),
          ],
        ),
      ),
    );
  }
}
