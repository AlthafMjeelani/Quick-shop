import 'package:ecommerse/screens/address/controller/screen_address_provider.dart';
import 'package:ecommerse/screens/address/widgets/screen_addresslist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenAddressWidget extends StatelessWidget {
  const ScreenAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenAddressProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                data.goToAdressScreen();
              },
              child: const Text('EDIT ADDRESS')),
           AddressListViewwidget(isStepper: data.isStepperAddressList=false),
        ],
      ),
    );
  }
}