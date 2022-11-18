import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/address/controller/screen_address_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressListViewwidget extends StatelessWidget {
  const AddressListViewwidget({
    Key? key,  this.isStepper,
  }) : super(key: key);
final bool? isStepper;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ScreenAddressProvider data, child) {
      return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 222, 217, 217),
            ),
            child:  ListTile(
                    leading:data.isStepperAddressList == true
                ? const SizedBox()
                : Transform.scale(
                      scale: 1.5,
                      child: Radio(
                        value: data.radioItem[index],
                        groupValue: data.newValue,
                        onChanged: (value) {
                          data.onRadioChange(value);
                        },
                      ),
                    ),
                    title: const Text(
                      'Home Address',
                      style: AppTextStyle.kTextBlack16Bold,
                    ),
                    subtitle: const Text(
                      'City Name',
                      style: AppTextStyle.kTextBlack14,
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_location_outlined,
                        size: 32,
                        color: Colors.black,
                      ),
                    ),
                  ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 3,
      );
    });
  }
}
