import 'dart:developer';

import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/home/widget/carousal_card_widget.dart';
import 'package:ecommerse/screens/home/widget/delegate.dart';
import 'package:ecommerse/screens/home/widget/home_category_widget.dart';
import 'package:ecommerse/widget/product_list_widget.dart';
import 'package:ecommerse/widget/shimmer_widget.dart';
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
      body: RefreshIndicator(
        onRefresh: () => data.getAllCategories(),
        child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome',
                      style: AppTextStyle.kTextBlack14,
                    ),
                    AppSpacing.ksizedBox2,
                    const Text(
                      'Althaf m',
                      style: AppTextStyle.kTextBlack16Bold,
                    ),
                    AppSpacing.ksizedBox20,
                    InkWell(
                      onTap: () => Delegate.showSearchfn(context),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const ListTile(
                          title: Text('Enter a Product name'),
                          trailing: Icon(
                            Icons.search,
                            size: 32,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    AppSpacing.ksizedBox10,
                    Consumer(
                      builder: (context, ScreenHomeProvider value, child) {
                        return value.isLoading
                            ? Shimmerwidget(
                                itemBuilder: (BuildContext ctx, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 4,
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Categories',
                                    style: AppTextStyle.kTextBlack20Size,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.17,
                                    child: value.categoryList.isEmpty
                                        ? const Center(
                                            child: Text(
                                              'No Categories',
                                              style:
                                                  AppTextStyle.kTextBlack16Bold,
                                            ),
                                          )
                                        : ListView.builder(
                                            itemCount:
                                                value.categoryList.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              final category =
                                                  value.categoryList[index];
                                              return GestureDetector(
                                                onTap: () => data.categoryView(
                                                  category.category!,
                                                  category.id.toString(),
                                                 
                                                ),
                                                child: Row(
                                                  children: [
                                                    HomeCategoriesWidget(
                                                      image: category?.icon
                                                              .toString() ??
                                                          'https://images.hasgeek.com/embed/file/65c4929262a84c78b29ad37321df2eca',
                                                      title: category!
                                                          .category
                                                          .toString(),
                                                    ),
                                                    AppSpacing.ksizedBoxW25,
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                  ),
                                  AppSpacing.ksizedBox10,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Special Offer',
                                        style: AppTextStyle.kTextBlack20Size,
                                      ),
                                    ],
                                  ),
                                  AppSpacing.ksizedBox5,
                                  const CarouselCardWidget(),
                                  AppSpacing.ksizedBox20,
                                  Row(
                                    children: const [
                                      Text(
                                        'Products',
                                        style: AppTextStyle.kTextBlack20Size,
                                      ),
                                      Spacer(),
                                      // InkWell(
                                      //   onTap: () {
                                      //     data.navigatorHomeToViewAll(context);
                                      //   },
                                      //   child: const Text(
                                      //     'View All',
                                      //     style: AppTextStyle.kTextBlack20Size,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  AppSpacing.ksizedBox10,
                                  const ProductViewWidget(),
                                ],
                              );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

