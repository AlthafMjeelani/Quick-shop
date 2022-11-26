import 'package:ecommerse/screens/wishlist/controller/screen_wishlist_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddorRemoveFavoriteWidget extends StatelessWidget {
  const AddorRemoveFavoriteWidget({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenWishlistProvider>(
      builder: (BuildContext context, value, Widget? child) {
        bool contains = false;
        List<String> idList = value.wishListProductElement.map((products) {
          return products.id!;
        }).toList();

        contains = idList.contains(productId);

        return InkWell(
          onTap: () {
            !contains
                ? value.addToWishlist(productId)
                : value.deleteWishlistItem(productId);
          },
          child: Icon(
            CupertinoIcons.heart_fill,
            size: 32,
            color: contains ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}
