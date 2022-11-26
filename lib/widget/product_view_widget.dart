import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/product/model/product_model.dart';
import 'package:ecommerse/screens/productdetails/controller/screen_product_details_provider.dart';
import 'package:ecommerse/screens/wishlist/controller/screen_wishlist_provider.dart';
import 'package:ecommerse/widget/fevorite_icon_widget.dart';
import 'package:ecommerse/widget/no_itemfound_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewWidget extends StatelessWidget {
  const ProductViewWidget({
    Key? key,
    required this.list,
    required this.itemCount,
  }) : super(key: key);

  final List<ProductElement> list;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ScreenProductDetailsProvider>(context, listen: false);
    final homeController =
        Provider.of<ScreenHomeProvider>(context, listen: false);

    return Consumer(
      builder: (context, ScreenHomeProvider value, child) {
        return list.isEmpty
            ? const CustomNotFoundWidget(
                title: "Product is Empty", subtitle: '')
            : GridView.builder(
                itemCount: itemCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.3),
                itemBuilder: (BuildContext context, int index) {
                  final product = list[index];

                  homeController.calculateOfferPrice(product);
                  
                  return GestureDetector(
                    onTap: () {
                      homeController.calculateOfferPrice(product);
                      // data.getSingleProductDetails(product.id,
                      //     homeController.offerPrice.round().toString());
                      // data.goToDetailspage(
                      //   homeController.offerPrice.round().toString(),
                      data.goToDetailspage(
                          homeController.offerPrice.round().toString(),
                          product.id!);
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Container(
                            // width: double.infinity,
                            height: 170,
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
                                child: AddorRemoveFavoriteWidget(
                                    productId: product.id.toString()),
                              ),
                            ),
                          ),
                          AppSpacing.ksizedBox10,
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
                                  '₹${homeController.offerPrice.round()}',
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
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
