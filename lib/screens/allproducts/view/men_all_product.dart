import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/allproducts/controller/all_product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenAllProduct extends StatelessWidget {
  const MenAllProduct({
    super.key,
    required this.imageurl,
    required this.productName,
    required this.productPrice,
  });
  final String imageurl;
  final String productName;
  final String productPrice;
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenAllProductProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            itemCount: data.favoriteListOfAllProduct.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1.3),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 11, 60, 117).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 58, 72, 77)
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(imageurl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              data.isFavedAllProduct(index);
                            },
                            child: Consumer(
                              builder: (BuildContext context,
                                  ScreenAllProductProvider value,
                                  Widget? child) {
                                return Icon(
                                  CupertinoIcons.heart_fill,
                                  size: AppTextStyle.kIconsize32,
                                  color: value.favoriteListOfAllProduct[index]
                                      ? Colors.red
                                      : Colors.grey,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      productName,
                      style: AppTextStyle.kTextsize16,
                    ),
                    Text(
                      productPrice,
                      style: AppTextStyle.kTextSize18Black,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
