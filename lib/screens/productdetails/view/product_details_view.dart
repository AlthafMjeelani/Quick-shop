import 'package:ecommerse/core/constents.dart';
import 'package:ecommerse/screens/productdetails/controller/screen_product_details_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenProductView extends StatelessWidget {
  const ScreenProductView({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.brandName,
    required this.productName,
    required this.productDisprice,
  });
  final String imageUrl;
  final String price;
  final String productDisprice;
  final String brandName;
  final String productName;
  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ScreenProductDetailsProvider>(context, listen: false);
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      // data.isFaved(index);
                    },
                    child: const Icon(
                      CupertinoIcons.heart_fill,
                      size: ConstentsItems.kIconsize32,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName,
                    style: ConstentsItems.kTextBlackLargeSize,
                  ),
                  Text(
                    productName,
                    style: ConstentsItems.kTextBlack,
                  ),
                  ConstentsItems.ksizedBox20,
                  const Text(
                    'Special price',
                    style: ConstentsItems.kPriceColor,
                  ),
                  ConstentsItems.ksizedBox5,
                  Row(
                    children: [
                      Text(
                        price,
                        style: ConstentsItems.kTextBlack40Size,
                      ),
                      ConstentsItems.ksizedBoxW10,
                      Text(
                        productDisprice,
                        style: ConstentsItems.kTextsizecrossLine,
                      ),
                      ConstentsItems.ksizedBoxW10,
                      const Text(
                        '60% off',
                        style: ConstentsItems.kPriceColor,
                      ),
                    ],
                  ),
                  ConstentsItems.ksizedBox20,
                  // const Text(
                  //   "Quantity",
                  // ),
                  // ConstentsItems.ksizedBox10,
                  // const CartCountWidget(),
                  // ConstentsItems.ksizedBox10,
                  const Text(
                    "Descriptioin",
                    style: ConstentsItems.kTextBlack20Size,
                  ),
                  const Text(
                    ' iLorem ipsum dolor sit amet, consectetur sdfd adipiscing elit. Facilisi sed consequat purusad nulla faucibus morbi amet Leo, aliquam more',
                    // style: AppTextStyle.body1,
                  ),
                  ConstentsItems.ksizedBox10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Size",
                        // style: AppTextStyle.body1
                      ),
                      Consumer(
                        builder: (BuildContext context,
                            ScreenProductDetailsProvider value, Widget? child) {
                          return Wrap(
                            spacing: 10,
                            direction: Axis.horizontal,
                            children: value.chipselection(),
                          );
                        },
                      ),
                      ConstentsItems.ksizedBox20,
                      GestureDetector(
                        onTap: () {},
                        child: const LongButtonWidget(text: 'ADD TO CART'),
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
