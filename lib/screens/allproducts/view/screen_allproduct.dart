import 'dart:developer';
import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/widget/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class ScreenAllProduct extends StatelessWidget {
  const ScreenAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    log('called');
    final homeController =
        Provider.of<ScreenHomeProvider>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlackColor,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'PRODUCTS',
          style: AppTextStyle.kTextSize18Black,
        ),
      ),
      body: Builder(
        builder: (context) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColors.kBgColor,
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Icon(
                              Icons.sort_sharp,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            hintText: 'Search Product Name',
                          ),
                        ),
                      ),
                      AppSpacing.ksizedBox20,
                      ProductViewWidget(
                        list: homeController.product?.products ?? [],
                        itemCount:
                            homeController.product?.products?.length ?? 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
