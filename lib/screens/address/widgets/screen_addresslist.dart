import 'dart:developer';

import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/address/controller/screen_address_provider.dart';
import 'package:ecommerse/utils/delete_items.dart';
import 'package:ecommerse/widget/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class AddressListViewwidget extends StatelessWidget {
  const AddressListViewwidget({
    Key? key,
    this.isStepper,
  }) : super(key: key);
  final bool? isStepper;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ScreenAddressProvider value, child) {
      return value.isLoading
          ? Shimmerwidget(
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
              itemCount: value.address.length,
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final address = value.address[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 222, 217, 217),
                  ),
                  child: ListTile(  
                    leading: value.isStepperAddressList == true
                        ? const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Icon(
                                Icons.location_on_outlined,
                                size: 32,
                              ),
                            ),
                          )
                        : Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              value: value.address[index].id,
                              groupValue: value.newValue,
                              onChanged: (radioValue) {
                                log(radioValue.toString());
                                value.onRadioChange(radioValue);
                              },
                            ),
                          ),
                    title: Text(
                      'Deliver to :  ${address.name ?? ""}',
                      style: AppTextStyle.kTextBlack16Boldblack,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSpacing.ksizedBox5,
                        Text(
                          address.address ?? "",
                          style: AppTextStyle.kTextBlack16,
                        ),
                        //AppSpacing.ksizedBox5,
                        Text(
                          "${address.city ?? ""}  pin :${address.pincode}",
                          style: AppTextStyle.kTextBlack16,
                        ),
                        // AppSpacing.ksizedBox5,
                        Row(
                          children: [
                            Text(
                              address.phone.toString(),
                              style: AppTextStyle.kTextBlack16,
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  DeleteItem.deleteItems(
                                    context,
                                    "Continue ?",
                                    "Are you sure to delete..",
                                    () {
                                      value
                                          .addressdelete(address.id.toString());
                                          value.getAllAddress();
                                      Get.back();

                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 25,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: value.address.length,
            );
    });
  }
}
