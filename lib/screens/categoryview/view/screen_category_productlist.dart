import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/categoryview/widgets/category_product_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreeenCategoryCollection extends StatelessWidget {
  const ScreeenCategoryCollection({
    super.key,
    required this.category,
  });
  final String category;
  @override
  Widget build(BuildContext context) {
    // final homeProvider =
    //     Provider.of<HomeScreenProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
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
          title: Text(
            category,
            style: AppTextStyle.kTextSize18Black,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                  child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.3),
                itemBuilder: (BuildContext context, int index) {
                  return const CategoryProductListWidget();
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
