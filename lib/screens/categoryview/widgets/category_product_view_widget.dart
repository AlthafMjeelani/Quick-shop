import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/categoryview/controller/category_product_controller.dart';
import 'package:ecommerse/widget/fevorite_icon_widget.dart';
import 'package:ecommerse/widget/no_itemfound_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryProductListWidget extends StatelessWidget {
  const CategoryProductListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, CategoryProductController value, child) {
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : value.catedoryProductsList == null
                ? const SizedBox()
                : value.catedoryProductsList!.isEmpty
                    ? const CustomNotFoundWidget(
                        title: "Product is Empty", subtitle: '')
                    : GridView.builder(
                        itemCount: value.catedoryProductsList?.length ?? 0,
                        // homeController.catedoryProductsList?.products?.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1 / 1.3),
                        itemBuilder: (BuildContext context, int index) {
                          final products = value.catedoryProductsList![index];
                          value.calculateOfferPrice(products);
                          return GestureDetector(
                            onTap: () {
                              value.calculateOfferPrice(products);
                              value.goToDeatailsPage(
                                value.catedoryProductsList![index].id
                                    .toString(),
                                value.offerPrice.round().toString(),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          products.colors?[0].images?[0] ?? "",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                          alignment: Alignment.topRight,
                                          child: AddorRemoveFavoriteWidget(
                                            productId: value
                                                .catedoryProductsList![index].id
                                                .toString(),
                                          )),
                                    ),
                                  ),
                                  AppSpacing.ksizedBox10,
                                  Text(
                                    products.name ?? "",
                                    style: AppTextStyle.kTextBlack16Bold,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '₹${products.price.toString()}',
                                          style: AppTextStyle
                                              .kTextsizecrossLineSmall,
                                        ),
                                        AppSpacing.ksizedBoxW5,
                                        Text(
                                          '₹${value.offerPrice.round()}',
                                          style: AppTextStyle.kTextBlack20Size,
                                        ),
                                        AppSpacing.ksizedBoxW5,
                                        Text(
                                          '${products.offer}% off',
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
