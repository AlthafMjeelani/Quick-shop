import 'package:ecommerse/core/constents.dart';
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
      width: 150,
      height: 50,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.black),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                data.countDecrement();
              },
              child: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 40,
              )),
          Container(
            width: 50,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.white),
            child: Center(
              child: Text(
                context.watch<ScreenCartProvider>().count.toString(),
                style: ConstentsItems.kTextSize18Black,
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
                size: 40,
              )),
        ],
      ),
    );
  }
}
