import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/allproducts/controller/all_product_provider.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/home/model/products/product_model.dart';
import 'package:ecommerse/screens/productdetails/controller/screen_product_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewWidget extends StatelessWidget {
  const ProductViewWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<ProductElement> list;
  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ScreenProductDetailsProvider>(context, listen: false);
    final productController =
        Provider.of<ScreenHomeProvider>(context, listen: false);
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
         
        });
    return list.isEmpty
        ? const Center(
            child: Text(
              'List Is Empty',
              style: AppTextStyle.kTextBlack16Bold,
            ),
          )
        : GridView.builder(
            itemCount: list.length <= 4 ? list.length : list.length = 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1.48),
            itemBuilder: (BuildContext context, int index) {
               productController.calculateOfferPrice(index);
              final product = list[index];
              return GestureDetector(
                onTap: () {
                  data.getSingleProductDetails(product.id);
                  productController.calculateOfferPrice(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 215,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              product.colors?[0].images?[0] ??
                                  'https://images.hasgeek.com/embed/file/65c4929262a84c78b29ad37321df2eca',
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
                      AppSpacing.ksizedBox5,
                      Text(
                        product.name.toString(),
                        style: AppTextStyle.kTextBlack16Bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '₹${product.price}',
                              style: AppTextStyle.kTextsizecrossLineSmall,
                            ),
                            AppSpacing.ksizedBoxW5,
                            Text(
                              '₹${productController.offerPrice.round()}',
                              style: AppTextStyle.kTextBlack20Size,
                            ),
                            AppSpacing.ksizedBoxW5,
                            Text(
                              '${product.offer}% off',
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
            },
          );
  }
}
