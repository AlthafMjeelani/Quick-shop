import 'package:ecommerse/helpers/spacing_widget.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.ksizedBox20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'ALTHAF M',
                  style: AppTextStyle.kTextBlack30Size,
                ),
                Text(
                  'althafjeelani159@gmail.com',
                  style: AppTextStyle.kTextBlack,
                ),
              ],
            ),
            AppSpacing.ksizedBox20,
            ListTileWidget(
              title: const Text(
                'Edit Profile',
                style: AppTextStyle.kTextsize16,
              ),
              leading: const Icon(Icons.person),
              onTap: () {
                data.navigationToProfile(context);
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
              onTap: () {
                data.navigationToAdress(context);
              },
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
