import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/cart/controller/screen_cart_provider.dart';
import 'package:ecommerse/screens/cart/model/cart_get_model.dart';
import 'package:ecommerse/screens/cart/widget/cart_count_button.dart';
import 'package:flutter/material.dart';

class ListTileElementsWidget extends StatelessWidget {
  const ListTileElementsWidget({
    Key? key,
    required this.cartProductItems,
    required this.cartController,
  }) : super(key: key);

  final ProductCartElement cartProductItems;
  final ScreenCartProvider cartController;

  @override
  Widget build(BuildContext context) {
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
                        cartProductItems.product?.colors?[0].images?[0] ?? ""),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.ksizedBox10,
            Text(
              cartProductItems.product?.name ?? 'No Name',
              style: AppTextStyle.kLongButton18Black,
            ),
            AppSpacing.ksizedBox5,
            SizedBox(
              width: 220,
              child: Text(
                cartProductItems.product?.description ?? 'No description',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AppSpacing.ksizedBox5,
            Text(
              'Size  :  ${cartProductItems.size}',
              style: AppTextStyle.kTextBlack16Bold,
            ),
            AppSpacing.ksizedBox5,
            Text(
              '₹${cartController.offerPrice.round()}',
              style: AppTextStyle.kTextBlackSize20Bold,
            ),
            AppSpacing.ksizedBox5,
            const CartCountWidget(),
            AppSpacing.ksizedBox5,
          ],
        ),
      ],
    );
  }
}