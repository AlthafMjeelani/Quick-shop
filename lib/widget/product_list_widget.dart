import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/product/model/product_model.dart';
import 'package:ecommerse/screens/productdetails/controller/screen_product_details_provider.dart';
import 'package:ecommerse/screens/wishlist/controller/screen_wishlist_provider.dart';
import 'package:ecommerse/widget/fevorite_icon_widget.dart';
import 'package:ecommerse/widget/no_itemfound_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewWidget extends StatelessWidget {
  const ProductViewWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ScreenProductDetailsProvider>(context, listen: false);
    final homeController =
        Provider.of<ScreenHomeProvider>(context, listen: false);

    return Consumer(
      builder: (context, ScreenHomeProvider value, child) {
        return homeController.product == null
            ? const SizedBox()
            : homeController.product!.isEmpty
                ? const CustomNotFoundWidget(
                    title: "Product is Empty", subtitle: '')
                : GridView.builder(
                    itemCount: homeController.product?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1 / 1.3),
                    itemBuilder: (BuildContext context, int index) {
                      final product = homeController.product![index];
                      homeController.calculateOfferPrice(product);
                      return GestureDetector(
                        onTap: () {
                          homeController.calculateOfferPrice(product);
                          data.goToDetailsPage(
                              homeController.offerPrice.round().toString(),
                              product.id!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white.withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '₹${product.price}',
                                      style:
                                          AppTextStyle.kTextsizecrossLineSmall,
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
