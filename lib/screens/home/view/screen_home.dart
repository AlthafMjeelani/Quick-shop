import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/home/widget/carousal_card_widget.dart';
import 'package:ecommerse/screens/home/widget/home_category_widget.dart';
import 'package:ecommerse/screens/productdetails/view/product_details_view.dart';
import 'package:ecommerse/widget/product_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenHomeProvider>(context, listen: false);
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
                  Row(
                    children: const [
                      Text(
                        'Welcome\nAlthaf m',
                        style: AppTextStyle.kTextBlack,
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person),
                      ),
                      AppSpacing.ksizedBoxW10,
                    ],
                  ),
                  AppSpacing.ksizedBox20,
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.sort_sharp,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      hintText: 'Search Tech Talk',
                    ),
                  ),
                  AppSpacing.ksizedBox20,
                  const CarouselCardWidget(),
                  AppSpacing.ksizedBox20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Categories',
                        style: AppTextStyle.kTextBlackLargeSize,
                      ),
                    ],
                  ),
                  AppSpacing.ksizedBox10,
                  const HomeCategoriesWidget(),
                  AppSpacing.ksizedBox20,
                  Row(
                    children: [
                      const Text(
                        'Latest Products',
                        style: AppTextStyle.kTextBlack20Size,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          data.navigatorHomeToViewAll(context);
                        },
                        child: const Text(
                          'View All',
                          style: AppTextStyle.kTextBlack20Size,
                        ),
                      )
                    ],
                  ),
                  AppSpacing.ksizedBox10,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ScreenProductView(
                                  imageUrl: 'assets/images/dressimage.png',
                                  price: '₹ 1,999'.toString(),
                                  brandName: 'VAN HEUSEN',
                                  productName:
                                      'Men Slim Fit Solid Spread Collar Casual Shirt',
                                  productDisprice: '2499',
                                )),
                      );
                    },
                    child: const ProductViewWidget(
                      imageurl: 'assets/images/dressimage.png',
                      productName: 'VAN HEUSEN SHIRT',
                      productPrice: '₹1,999',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
