import 'package:ecommerse/utils/bottomnav_screens.dart';
import 'package:ecommerse/screens/bottomnavigation/controller/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenBottomNavbar extends StatelessWidget {
  const ScreenBottomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<BottomNavProvider>(context, listen: false).currentPageIndex = 0;
    return Consumer<BottomNavProvider>(
      builder: (BuildContext context, BottomNavProvider value, Widget? child) {
        return WillPopScope(
          onWillPop: () async {
            await value.bottomNavbar();
            return false;
          },
          child: Scaffold(
            body: BottomNavPageList.screens[value.currentPageIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              elevation: 0,
              selectedItemColor: const Color.fromARGB(255, 12, 133, 255),
              unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
              currentIndex: value.currentPageIndex,
              onTap: (newIndex) {
                value.bottomShift(newIndex);
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Wishlist',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Account',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
