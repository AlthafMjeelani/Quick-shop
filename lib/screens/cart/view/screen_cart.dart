import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/cart/controller/screen_cart_provider.dart';
import 'package:ecommerse/screens/cart/widget/cart_count_button.dart';
import 'package:ecommerse/screens/cart/widget/chechout_button.dart';
import 'package:ecommerse/utils/checkout_bottomsheet.dart';
import 'package:ecommerse/utils/delete_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    final cartController =
        Provider.of<ScreenCartProvider>(context, listen: false);
    return Scaffold(
      body: Container(
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
                    if (value.isLoading==true) {
                      const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (value.cartProducts == null) {
                      const Center(
                        child: Text('No items in the cart!'),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final cartProductItems =
                              value.cartProducts!.products![index];
                          value.calculateOfferPrice(cartProductItems.product!);
                          return Container(
                            height: size * 0.18,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey),
                            child: FittedBox(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      height: 150,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  cartProductItems
                                                          .product
                                                          ?.colors?[0]
                                                          .images?[0] ??
                                                      ""),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppSpacing.ksizedBox20,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            cartProductItems.product?.name ??
                                                'No Name',
                                            style:
                                                AppTextStyle.kTextBlack20Size,
                                          ),
                                          AppSpacing.ksizedBoxW120,
                                          IconButton(
                                              onPressed: () {
                                                DeleteItem.deleteItems(
                                                  context,
                                                  'Continue',
                                                  'Are you sure to Delete Item?',
                                                  () {},
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.delete_outlined,
                                                color: Colors.red,
                                                size: 32,
                                              ))
                                        ],
                                      ),
                                      Text(
                                        cartProductItems.product?.description ??
                                            'No description',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      AppSpacing.ksizedBox5,
                                      Text(
                                        'Size  :  ${cartProductItems.size}',
                                        style: AppTextStyle.kTextBlack20Size,
                                      ),
                                      AppSpacing.ksizedBoxW20,
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              value.offerPrice
                                                  .round()
                                                  .toString(),
                                              style:
                                                  AppTextStyle.kTextBlack30Size,
                                            ),
                                            AppSpacing.ksizedBoxW120,
                                            const CartCountWidget(
                                                // productElement:
                                                //     cartProductItems,
                                                // index: index,
                                                ),
                                          ],
                                        ),
                                      ),
                                      // Align(
                                      //     alignment: Alignment.bottomRight,
                                      //     child: CartCountWidget()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: value.cartProducts?.products?.length??0,
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  CheckOutBottomSheet.checkOut(context);
                },
                child: const CheckOutButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
