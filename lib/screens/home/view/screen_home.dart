import 'package:ecommerse/core/constents.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/home/widget/carousal_card_widget.dart';
import 'package:ecommerse/screens/home/widget/home_category_widget.dart';
import 'package:ecommerse/screens/productdetails/view/product_details_view.dart';
import 'package:ecommerse/widget/product_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenHomeProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: ConstentsItems.kBgColor,
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
                        style: ConstentsItems.kTextBlack,
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person),
                      ),
                      ConstentsItems.ksizedBoxW10,
                    ],
                  ),
                  ConstentsItems.ksizedBox20,
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
                  ConstentsItems.ksizedBox20,
                  const CarouselCardWidget(),
                  ConstentsItems.ksizedBox20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Categories',
                        style: ConstentsItems.kTextBlackLargeSize,
                      ),
                    ],
                  ),
                  ConstentsItems.ksizedBox10,
                  const HomeCategoriesWidget(),
                  ConstentsItems.ksizedBox20,
                  Row(
                    children: [
                      const Text(
                        'Latest Products',
                        style: ConstentsItems.kTextBlack20Size,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          data.navigatorHomeToViewAll(context);
                        },
                        child: const Text(
                          'View All',
                          style: ConstentsItems.kTextBlack20Size,
                        ),
                      )
                    ],
                  ),
                  ConstentsItems.ksizedBox10,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ScreenProductView(),
                        ),
                      );
                    },
                    child: const ProductViewWidget(
                      imageurl: 'assets/images/dressimage.png',
                      productName: 'PRODUCT NAME',
                      productPrice: '₹ 1,999',
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
