import 'dart:developer';
import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/allproducts/controller/all_product_provider.dart';
import 'package:ecommerse/screens/allproducts/view/men_all_product.dart';
import 'package:ecommerse/screens/allproducts/view/screen_all_product.dart';
import 'package:ecommerse/screens/allproducts/view/women_all_product.dart';
import 'package:ecommerse/widget/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenallCategory extends StatelessWidget {
  const ScreenallCategory({super.key});

  @override
  Widget build(BuildContext context) {
    log('called');
    final data = Provider.of<ScreenAllProductProvider>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            data.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlackColor,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'PRODUCTS',
          style: AppTextStyle.kTextSize18Black,
        ),
      ),
      body: Builder(builder: (context) {
        final tabController =
            TabController(length: 3, vsync: Scaffold.of(context));
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            //color: Colors.yellow

            gradient: AppColors.kBgColor,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
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
                  TabbarWidget(
                    tabController: tabController,
                    tabs: const [
                      Tab(text: 'ALL'),
                      Tab(text: 'MEN'),
                      Tab(text: 'WOMEN'),
                    ],
                  ),
                  AppSpacing.ksizedBox20,
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        AllProductViewWidget(
                          imageurl: 'assets/images/shirtimage.png',
                          productName: 'Classic Polo ',
                          productPrice: '₹399',
                          brandName: 'Solid Men Polo Neck Green T-Shirt',
                          productDisPrice: '₹999',
                        ),
                        MenAllProduct(
                            imageurl: 'assets/images/dressimage.png',
                            productName: 'productName',
                            productPrice: 'productPrice'),
                        WomenAllProduct(
                            imageurl: 'assets/images/womenimage.png',
                            productName: 'productName',
                            productPrice: 'productPrice'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
