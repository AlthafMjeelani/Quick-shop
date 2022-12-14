import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/screens/cart/controller/screen_cart_provider.dart';
import 'package:ecommerse/screens/cart/widget/cart_list_elements.dart';
import 'package:ecommerse/screens/cart/widget/chechout_button.dart';
import 'package:ecommerse/screens/productdetails/controller/screen_product_details_provider.dart';
import 'package:ecommerse/screens/cart/widget/checkout_bottomsheet.dart';
import 'package:ecommerse/widget/no_itemfound_widget.dart';
import 'package:ecommerse/widget/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    final cartController =
        Provider.of<ScreenCartProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartController.getAllCartProducts();
    });
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          cartController.getAllCartProducts();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: AppColors.kBgColor,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Consumer(
                    builder: (BuildContext context, ScreenCartProvider value,
                        Widget? child) {
                      return value.isLoading == true
                          ? Shimmerwidget(
                              itemBuilder: (BuildContext ctx, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              },
                              itemCount: 4,
                            )
                          : value.cartProducts == null
                              ? const CustomNotFoundWidget(
                                  title: "You have't added any\nProduct yet",
                                  subtitle: '')
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final cartProductItems =
                                          value.cartProducts!.products![index];
                                      value.calculateOfferPrice(index);

                                      return GestureDetector(
                                        onTap: () {
                                          value.calculateOfferPrice(index);
                                          context
                                              .read<
                                                  ScreenProductDetailsProvider>()
                                              .goToDetailsPage(
                                                cartController.offerPrice
                                                    .round()
                                                    .toString(),
                                                cartProductItems.product!.id
                                                    .toString(),
                                              );
                                        },
                                        child: Dismissible(
                                          background: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 45,
                                          ),
                                          onDismissed: (direction) {},
                                          key: Key(cartProductItems.toString()),
                                          child: Container(
                                            height: size * 0.23,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all()),
                                            child: ListTileElementsWidget(
                                              index: index,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        thickness: 3,
                                        color: Colors.white,
                                      );
                                    },
                                    itemCount:
                                        value.cartProducts?.products?.length ??
                                            0,
                                  ),
                                );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      CheckOutBottomSheet.checkOut(
                          context, cartController.totalPrice.toString());
                    },
                    child: const CheckOutButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
