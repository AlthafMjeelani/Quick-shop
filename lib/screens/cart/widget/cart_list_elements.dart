import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/cart/controller/screen_cart_provider.dart';
import 'package:ecommerse/screens/cart/widget/cart_count_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTileElementsWidget extends StatelessWidget {
  const ListTileElementsWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final cartController =
        Provider.of<ScreenCartProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartController.calculateOfferPrice(index);
    });
    return Row(
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
                      cartController.cartProducts!.products![index].product
                              ?.colors?[0].images?[0] ??
                          "",
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.ksizedBox25,
            Text(
              cartController.cartProducts!.products![index].product?.name ??
                  'No Name',
              style: AppTextStyle.kTextBlack20Size,
            ),
            AppSpacing.ksizedBox5,
            SizedBox(
              width: 220,
              child: Text(
                cartController
                        .cartProducts!.products![index].product?.description ??
                    'No description',
                style: const TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AppSpacing.ksizedBox5,
            Text(
              'Size  :  ${cartController.cartProducts!.products![index].size}',
              style: AppTextStyle.kTextBlack16Bold,
            ),
            AppSpacing.ksizedBox5,
            Text(
              '₹${cartController.offerPrice.round()}',
              style: AppTextStyle.kTextBlack20Size,
            ),
            AppSpacing.ksizedBox5,
            SizedBox(
              width: 220,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(),
                  CartCountWidget(),
                ],
              ),
            ),
            AppSpacing.ksizedBox5,
          ],
        ),
      ],
    );
  }
}
