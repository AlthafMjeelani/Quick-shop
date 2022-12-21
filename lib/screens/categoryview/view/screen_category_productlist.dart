import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/categoryview/controller/category_product_controller.dart';
import 'package:ecommerse/screens/categoryview/widgets/category_product_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class ScreeenCategoryCollection extends StatelessWidget {
  const ScreeenCategoryCollection({
    super.key,
    required this.category,
    required this.categoryId,
  });
  final String category;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    final categoryProductController =
        Provider.of<CategoryProductController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      categoryProductController.getAllCatedoryProducts(categoryId);
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color.fromARGB(255, 32, 32, 32),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.kWhiteColor,
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
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: AppColors.kBgColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                Expanded(
                  child: CategoryProductListWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
