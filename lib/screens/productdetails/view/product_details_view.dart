import 'package:ecommerse/core/constents.dart';
import 'package:flutter/material.dart';

class ScreenProductView extends StatelessWidget {
  const ScreenProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/images/dressimage.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      "product name",
                      style: ConstentsItems.kTextBlackLargeSize,
                    ),
                    Spacer(),
                    Text(
                      '₹1,999',
                      style: ConstentsItems.kTextsize16,
                    )
                  ],
                ),
                ConstentsItems.ksizedBox10,
                Row(
                  children: const [
                    Text(
                      "Quantity",
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        //color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                          Text("0"),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.3,
                  child: const Text(
                    '₹1,999',
                    style: ConstentsItems.kTextsize16,
                  ),
                ),
                const Text(
                  "Descriptioin",
                  style: ConstentsItems.kTextBlack20Size,
                ),
                const Text(
                  ' iLorem ipsum dolor sit amet, consectetur sdfd adipiscing elit. Facilisi sed consequat purusad nulla faucibus morbi amet Leo, aliquam more',
                  // style: AppTextStyle.body1,
                ),
                ConstentsItems.ksizedBox10,
                Text('sss'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Size",
                      // style: AppTextStyle.body1
                    ),
                    Row(
                      children: [
                        ChoiceChip(
                          side: BorderSide(),
                          onSelected: (valuee) {},
                          selected: true,
                          label: Text(
                            'S',
                            //style: AppTextStyle.bodySmall,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        ChoiceChip(
                          side: BorderSide(),
                          onSelected: (valuee) {},
                          selected: true,
                          label: Text(
                            'M',
                            //style: AppTextStyle.bodySmall,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        ChoiceChip(
                          side: BorderSide(),
                          onSelected: (valuee) {},
                          selected: true,
                          label: Text(
                            'L',
                            //style: AppTextStyle.bodySmall,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
                    ),

                    // Expanded(
                    //   child: CustomButtonWidget(
                    //     text: "Add to cart",
                    //     onTap: () {
                    //       cartController.addProductToCart(product);
                    //       Navigator.of(context).pop();
                    //     },
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
