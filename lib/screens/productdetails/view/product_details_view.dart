import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/productdetails/controller/screen_product_details_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:provider/provider.dart';

class ScreenProductView extends StatelessWidget {
  const ScreenProductView({
    super.key,
    // required this.index,
    // required this.productElement,
  });
  //final int index;
  //final ProductElement productElement;
  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ScreenProductDetailsProvider>(context, listen: false);
    final dataHome = Provider.of<ScreenHomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // dataHome.calculateOfferPrice();
    });

    data.selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            data.popPage(context);
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
        child: Column(
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
                itemCount: data.productElement!.colors![0].images!.length,
                //itemCount: 1,
                slideBuilder: (index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(
                            data.productElement?.colors?[0].images?[index] ??
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
                  // Text(
                  //   brandName,
                  //   style: AppTextStyle.kTextBlackLargeSize,
                  // ),
                  Row(
                    children: [
                      Text(
                        data.productElement?.name ?? 'No Nmae',
                        style: AppTextStyle.kLongButtonBlack,
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            // data.isFaved(index);
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
                    data.productElement?.description ?? '',
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
                        '₹${data.productElement?.price}',
                        style: AppTextStyle.kTextsizecrossLine,
                      ),
                      AppSpacing.ksizedBoxW10,
                      Text(
                        '₹${dataHome.offerPrice.round()}',
                        style: AppTextStyle.kTextBlack30Size,
                      ),
                      AppSpacing.ksizedBoxW10,
                      Text(
                        '${data.productElement?.offer}% off',
                        style: AppTextStyle.kPriceColor,
                      ),
                    ],
                  ),

                  AppSpacing.ksizedBox10,

                  // const Text(
                  //   'iLorem ipsum dolor sit amet, consectetur sdfd adipiscing elit. Facilisi sed consequat purusad nulla faucibus morbi amet Leo, aliquam more',
                  //   // style: AppTextStyle.body1,
                  // ),

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
                              i < data.productElement!.size!.length;
                              i++)
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 5),
                              child: Consumer(
                                builder: (BuildContext context,
                                    ScreenProductDetailsProvider detailsvalue,
                                    Widget? child) {
                                  return ChoiceChip(
                                    label: Text(
                                      data.productElement?.size![i],
                                      style: AppTextStyle.kTextBlack20Size,
                                    ),
                                    labelStyle: const TextStyle(
                                        //color: Color.fromARGB(255, 14, 6, 6),
                                        ),
                                    selectedColor: Colors.blue,
                                    selected: detailsvalue.selectedIndex == i,
                                    onSelected: (bool value) {
                                      detailsvalue.choiceshipselect(i);
                                    },
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                      AppSpacing.ksizedBox20,
                      GestureDetector(
                        onTap: () {},
                        child: const LongButtonWidget(text: 'ADD TO CART'),
                      ),
                      AppSpacing.ksizedBox20,
                      GestureDetector(
                        onTap: () {
                          data.gitocheckOut();
                        },
                        child: const LongButtonWidget(text: 'BUY NOW'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
