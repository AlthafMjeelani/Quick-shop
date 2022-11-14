import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/address/controller/screen_add_address_provider.dart';
import 'package:ecommerse/screens/address/controller/screen_address_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenAddAddress extends StatelessWidget {
  const ScreenAddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AddAddressProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            data.popPage(context);
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextfeildWidget(
                  controller: data.homeAddressController,
                  text: 'Home Address',
                  obscureText: false,
                ),
                AppSpacing.ksizedBox10,
                TextfeildWidget(
                  controller: data.cityAddressController,
                  text: 'city',
                  obscureText: false,
                ),
                AppSpacing.ksizedBox10,
                TextfeildWidget(
                  controller: data.pinCodeAddressController,
                  text: 'Pin Code',
                  obscureText: false,
                ),
                AppSpacing.ksizedBox10,
                TextfeildWidget(
                  controller: data.countryAddressController,
                  text: 'Country',
                  obscureText: false,
                ),
                AppSpacing.ksizedBox20,
                Consumer(
                  builder: (context, AddAddressProvider value, child) {
                    return value.isLoading == true
                        ? const CircularProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.location_searching_outlined),
                              TextButton(
                                onPressed: () {
                                  data.getCurrentAddress();
                                },
                                child: const Text(
                                  'Choose Your Current Location',
                                ),
                              )
                            ],
                          );
                  },
                ),
                AppSpacing.ksizedBox30,
                GestureDetector(
                  onTap: () {
                    data.navigationToAddAdress(context);
                  },
                  child: const LongButtonWidget(
                    text: 'ADD',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
