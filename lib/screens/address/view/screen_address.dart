import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/address/controller/screen_address_provider.dart';
import 'package:ecommerse/screens/address/widgets/screen_addresslist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenAddress extends StatelessWidget {
  const ScreenAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenAddressProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      data.getAllAddress();
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          data.goToAddAdressScreen();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            data.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'ADD ADDRESS',
          style: AppTextStyle.kTextSize18Black,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppSpacing.ksizedBox10,
            AddressListViewwidget(isStepper: data.isStepperAddressList = true),
          ],
        ),
      ),
    );
  }
}
