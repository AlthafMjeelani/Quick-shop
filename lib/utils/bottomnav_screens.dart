import 'package:ecommerse/screens/account/view/screen_account.dart';
import 'package:ecommerse/screens/cart/view/screen_cart.dart';
import 'package:ecommerse/screens/home/view/screen_home.dart';
import 'package:ecommerse/screens/wishlist/view/screen_wishlist.dart';

class BottomNavPageList {
  static const List screens = [
    ScreenHome(),
    ScreenCart(),
    ScreenWishlist(),
    ScreenAccount(),
  ];
}
