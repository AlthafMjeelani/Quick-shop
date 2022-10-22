import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/cart/widget/cart_count_button.dart';
import 'package:ecommerse/screens/cart/widget/chechout_button.dart';
import 'package:ecommerse/utils/checkout_bottomsheet.dart';
import 'package:ecommerse/utils/delete_items.dart';
import 'package:flutter/material.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.kBgColor,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
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
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/images/dressimage.png'),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppSpacing.ksizedBox20,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'VAN HEUSEN',
                                        style: AppTextStyle.kTextBlack20Size,
                                      ),
                                      AppSpacing.ksizedBoxW120,
                                      IconButton(
                                          onPressed: () {
                                            DeleteItem.deleteItems(
                                              context,
                                              'Continue',
                                              'Are you sure to Delete Item?',
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.delete_outlined,
                                            color: Colors.red,
                                            size: 32,
                                          ))
                                    ],
                                  ),
                                  const Text(
                                    'Men Slim Fit Solid Spread\nCollar Casual Shirt',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  AppSpacing.ksizedBox5,
                                  const Text(
                                    'Size  :  M',
                                    style: AppTextStyle.kTextBlack20Size,
                                  ),
                                  AppSpacing.ksizedBoxW20,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          '₹1999',
                                          style: AppTextStyle.kTextBlack30Size,
                                        ),
                                        AppSpacing.ksizedBoxW120,
                                        CartCountWidget(),
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
                    itemCount: 10,
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
      ),
    );
  }
}
