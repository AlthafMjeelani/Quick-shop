import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/cart/controller/screen_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCountWidget extends StatelessWidget {
  const CartCountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenCartProvider>(context, listen: false);
    return Container(
      width: 100,
      height: 40,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 54, 54, 54)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                data.countDecrement();
              },
              child: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 25,
              )),
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.white),
            child: Center(
              child: Text(
                context.watch<ScreenCartProvider>().count.toString(),
                style: AppTextStyle.kTextSize18Black,
              ),
            ),
          ),
          InkWell(
              onTap: () {
                data.countIncrement();
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 25,
              )),
        ],
      ),
    );
  }
}
