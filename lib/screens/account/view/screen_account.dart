import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/account/controller/screen_account_privider.dart';
import 'package:ecommerse/widget/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenAccountProvider>(context, listen: false);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTileWidget(
              title: const Text(
                'Profile',
                style: AppTextStyle.kTextsize16,
              ),
              leading: const Icon(Icons.person),
              onTap: () {
                data.navogationToProfile(context);
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTileWidget(
              title: const Text(
                'Orders',
                style: AppTextStyle.kTextsize16,
              ),
              leading: const Icon(Icons.shopping_bag),
              onTap: () {},
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTileWidget(
              title: const Text(
                'Address',
                style: AppTextStyle.kTextsize16,
              ),
              leading: const Icon(Icons.location_on_outlined),
              onTap: () {},
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTileWidget(
              title: const Text(
                'Help Center',
                style: AppTextStyle.kTextsize16,
              ),
              leading: const Icon(Icons.message_outlined),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTileWidget(
              title: const Text(
                'invite Friends',
                style: AppTextStyle.kTextsize16,
              ),
              leading: const Icon(Icons.share_outlined),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTileWidget(
              title: const Text(
                'Privecy Policy',
                style: AppTextStyle.kTextsize16,
              ),
              leading: const Icon(Icons.info_outline),
              onTap: () {},
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
