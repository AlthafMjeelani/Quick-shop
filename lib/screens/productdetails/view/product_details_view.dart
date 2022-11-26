import 'dart:developer';

import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/cart/controller/screen_cart_provider.dart';
import 'package:ecommerse/screens/cart/model/cart_get_model.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/home/view/screen_home.dart';
import 'package:ecommerse/screens/product/model/product_model.dart';
import 'package:ecommerse/screens/productdetails/controller/screen_product_details_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/shimmer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:provider/provider.dart';

class ScreenProductView extends StatelessWidget {
  const ScreenProductView({
    super.key,
    required this.offerPrice,
    required this.productId,
  });

  final String offerPrice;
  final String productId;
  @override
  Widget build(BuildContext context) {
    final singleProductController =
        Provider.of<ScreenProductDetailsProvider>(context, listen: false);
    final homeController =
        Provider.of<ScreenHomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log('product Id is :   ${productId.toString()}');
      singleProductController.getSingleProductDetails(productId);
    });
    singleProductController.selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            singleProductController.popPage(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'PRODUCT DETAILS',
          style: AppTextStyle.kTextSize18Black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ScreenProductDetailsProvider value, child) {
            return value.isLoading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Shimmerwidget(
                      itemCount: 5,
                      itemBuilder: (p0, p1) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                width: 350,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                : value.productElement == null
                    ? SizedBox()
                    : Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: CarouselSlider.builder(
                              slideIndicator: CircularSlideIndicator(
                                currentIndicatorColor: Colors.blue,
                                itemSpacing: 25,
                                indicatorRadius: 7,
                                padding: const EdgeInsets.only(bottom: 12),
                              ),
                              itemCount: value.productElement?.colors![0].images
                                      ?.length ??
                                  0,
                              //itemCount: 1,
                              slideBuilder: (index) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    // color: Colors.blue,
                                    image: DecorationImage(
                                      image: NetworkImage(value.productElement
                                              ?.colors?[0].images?[index] ??
                                          ''),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      value.productElement?.name ?? 'No Nmae',
                                      style: AppTextStyle.kLongButtonBlack,
                                    ),
                                    const Spacer(),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          // value.isFaved(index);
                                        },
                                        child: const Icon(
                                          CupertinoIcons.heart_fill,
                                          size: AppTextStyle.kIconsize32,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                                AppSpacing.ksizedBox10,
                                Text(
                                  value.productElement?.description ?? '',
                                  style: AppTextStyle.kTextBlack,
                                ),
                                AppSpacing.ksizedBox10,
                                const Text(
                                  'Special price',
                                  style: AppTextStyle.kPriceColor,
                                ),
                                AppSpacing.ksizedBox2,
                                Row(
                                  children: [
                                    Text(
                                      '₹${value.productElement?.price}',
                                      style: AppTextStyle.kTextsizecrossLine,
                                    ),
                                    AppSpacing.ksizedBoxW10,
                                    Text(
                                      '₹$offerPrice',
                                      style: AppTextStyle.kTextBlack30Size,
                                    ),
                                    AppSpacing.ksizedBoxW10,
                                    Text(
                                      '${value.productElement?.offer}% off',
                                      style: AppTextStyle.kPriceColor,
                                    ),
                                  ],
                                ),
                                AppSpacing.ksizedBox10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Size : ",
                                      style: AppTextStyle.kTextSize18Black,
                                    ),
                                    Row(
                                      children: [
                                        for (int i = 0;
                                            i <
                                                value.productElement!.size!
                                                    .length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 5),
                                            child: Consumer(
                                              builder: (BuildContext context,
                                                  ScreenProductDetailsProvider
                                                      detailsvalue,
                                                  Widget? child) {
                                                return ChoiceChip(
                                                  label: Text(
                                                    value.productElement
                                                        ?.size![i],
                                                    style: AppTextStyle
                                                        .kTextBlack20Size,
                                                  ),
                                                  labelStyle: const TextStyle(
                                                      //color: Color.fromARGB(255, 14, 6, 6),
                                                      ),
                                                  selectedColor: Colors.blue,
                                                  selected: detailsvalue
                                                          .selectedIndex ==
                                                      i,
                                                  onSelected: (bool value) {
                                                    detailsvalue
                                                        .choiceshipselect(i);
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                    AppSpacing.ksizedBox20,
                                    Consumer(
                                      builder: (context,
                                          ScreenCartProvider cartvalues,
                                          child) {
                                        return cartvalues.isLoadingAddCart
                                            ? const Center(
                                                child:
                                                    CupertinoActivityIndicator())
                                            : GestureDetector(
                                                onTap: () {
                                                  log(value.productElement!
                                                          .size![
                                                      value.selectedIndex]);
                                                  log(value
                                                      .productElement!.id!);
                                                  log(value.productElement!
                                                      .colors![0].color!);
                                                  cartvalues.addToCart(
                                                    value.productElement!.id!,
                                                    value.productElement!.size![
                                                        value.selectedIndex],
                                                    value.productElement!
                                                        .colors![0].color!,
                                                  );
                                                  // cartController.getAllCartProducts();
                                                },
                                                child: const LongButtonWidget(
                                                    text: 'ADD TO CART'),
                                              );
                                      },
                                    ),
                                    AppSpacing.ksizedBox20,
                                    GestureDetector(
                                      onTap: () {
                                        value.gitocheckOut();
                                      },
                                      child: const LongButtonWidget(
                                          text: 'BUY NOW'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
          },
        ),
      ),
    );
  }
}
