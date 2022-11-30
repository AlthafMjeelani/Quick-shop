import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/address/controller/screen_add_address_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ScreenAddAddress extends StatelessWidget {
  ScreenAddAddress({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final addAddressController =
        Provider.of<AddAddressProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            addAddressController.popPage(context);
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Consumer<AddAddressProvider>(builder: (context, values, _) {
                  return SizedBox(
                    height: 300,
                    child: GoogleMap(
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: true,
                      mapType: MapType.hybrid,
                      initialCameraPosition: values.initialLocation,
                      onMapCreated: (GoogleMapController controller) {
                        if (addAddressController
                            .googleMapController.isCompleted) {
                          return;
                        }
                        addAddressController.googleMapController
                            .complete(controller);
                      },
                      buildingsEnabled: true,
                      compassEnabled: true,
                      indoorViewEnabled: true,
                      mapToolbarEnabled: true,
                      myLocationEnabled: true,
                      onTap: (argument) {
                        addAddressController.addMarker(
                          argument.latitude,
                          argument.longitude,
                        );
                      },
                    ),
                  );
                }),
                // AppSpacing.ksizedBox10,
                Consumer(
                  builder: (context, AddAddressProvider value, child) {
                    return value.isLoading == true
                        ? const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.location_searching_outlined),
                              TextButton(
                                onPressed: () {
                                  addAddressController.getCurrentAddress();
                                },
                                child: const Text(
                                  'Choose Your Current Location',
                                ),
                              )
                            ],
                          );
                  },
                ),
                AppSpacing.ksizedBox10,
                TextfeildWidget(
                  controller: addAddressController.nameAddressController,
                  text: 'Name',
                  obscureText: false,
                  validator: (value) => addAddressController.validator(value),
                ),
                AppSpacing.ksizedBox10,
                TextfeildWidget(
                  controller: addAddressController.homeAddressController,
                  text: 'Home Address',
                  obscureText: false,
                  validator: (value) => addAddressController.validator(value),
                ),
                AppSpacing.ksizedBox10,
                TextfeildWidget(
                  controller: addAddressController.cityAddressController,
                  text: 'city',
                  obscureText: false,
                  validator: (value) => addAddressController.validator(value),
                ),
                AppSpacing.ksizedBox10,
                TextfeildWidget(
                  controller: addAddressController.pinCodeAddressController,
                  text: 'Pin Code',
                  obscureText: false,
                  validator: (value) => addAddressController.validator(value),
                   keyboardType: TextInputType.phone,
                ),
                AppSpacing.ksizedBox10,
                TextfeildWidget(
                  controller: addAddressController.phoneAddressController,
                  text: 'Phone Number',
                  obscureText: false,
                  validator: (value) => addAddressController.validator(value),
                  keyboardType: TextInputType.phone,
                ),
                AppSpacing.ksizedBox20,
                GestureDetector(
                  onTap: () {
                    addAddressController.navigationToAddAdress(context);
                  },
                  child: LongButtonWidget(
                    text: 'ADD',
                    onTap: () {
                      addAddressController.addAddress(
                        _formKey,
                      );
                    },
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
