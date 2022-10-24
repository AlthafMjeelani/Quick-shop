import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/address/controller/screen_address_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenAddress extends StatelessWidget {
  const ScreenAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenAddressProvider>(context, listen: false);
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
          'ADDRESS',
          style: AppTextStyle.kTextSize18Black,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 146, 141, 141),
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.location_on_outlined,
                          size: 40,
                          color: Colors.black,
                        ),
                        title: const Text(
                          'Home Address',
                          style: AppTextStyle.kLongButtonBlack,
                        ),
                        subtitle: const Text(
                          'City Name',
                          style: AppTextStyle.kTextBlack,
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
                  itemCount: 3),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
              child: GestureDetector(
                onTap: () {
                  data.navigationToAddAdress(context);
                },
                child: const LongButtonWidget(
                  text: 'ADD NEW ADDRESS',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
