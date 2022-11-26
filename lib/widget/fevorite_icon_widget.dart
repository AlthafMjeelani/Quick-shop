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
    final wishlistController =
        Provider.of<ScreenWishlistProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wishlistController.checkIsFev(productId);
    });
    return Consumer<ScreenWishlistProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return InkWell(
          onTap: () {
            !value.contains == true
                ? value.addToWishlist(productId)
                : value.deleteWishlistItem(productId);
          },
          child: Icon(
            CupertinoIcons.heart_fill,
            size: 32,
            color: value.contains == true ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}
