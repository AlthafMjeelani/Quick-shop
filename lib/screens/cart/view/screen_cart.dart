import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/cart/widget/cart_count_button.dart';
import 'package:ecommerse/screens/cart/widget/chechout_button.dart';
import 'package:flutter/material.dart';

class ScreeCart extends StatelessWidget {
  const ScreeCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.kBgColor,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: 150,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: const Image(
                                  image: AssetImage(
                                      'assets/images/dressimage.png'),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppSpacing.ksizedBox40,
                                const Text(
                                  'VAN HEUSEN',
                                  style: AppTextStyle.kTextBlack20Size,
                                ),
                                const FittedBox(
                                  child: Text(
                                    'Men Slim Fit Solid Spread\nCollar Casual Shirt',
                                  ),
                                ),
                                AppSpacing.ksizedBox5,
                                const Text(
                                  'Size  :  M',
                                  style: AppTextStyle.kTextBlack,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      '₹1999',
                                      style: AppTextStyle.kLongButtonBlack,
                                    ),
                                    AppSpacing.ksizedBoxW20,
                                    CartCountWidget(),
                                  ],
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete_outlined,
                                  color: Colors.red,
                                  size: 32,
                                ))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 3,
                  ),
                  AppSpacing.ksizedBox20,
                  GestureDetector(
                    onTap: () {},
                    child: const CheckOutButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
