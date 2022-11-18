import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/home/widget/carousal_card_widget.dart';
import 'package:ecommerse/screens/home/widget/delegate.dart';
import 'package:ecommerse/screens/home/widget/home_category_widget.dart';
import 'package:ecommerse/widget/product_view_widget.dart';
import 'package:ecommerse/widget/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenHomeProvider>(context, listen: false);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => data.getAllCategories(),
        child: Container(
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
                    Row(
                      children: [
                        const Text(
                          'Welcome\nAlthaf m',
                          style: AppTextStyle.kTextBlack,
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 30,
                          child: IconButton(
                            icon: const Icon(Icons.person),
                            onPressed: () {},
                          ),
                        ),
                        AppSpacing.ksizedBoxW10,
                      ],
                    ),
                    AppSpacing.ksizedBox20,
                    InkWell(
                      onTap: () => Delegate.showSearchfn(context),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const ListTile(
                          title: Text('Enter a Product name'),
                          trailing: Icon(
                            Icons.search,
                            size: 32,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    AppSpacing.ksizedBox10,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.17,
                      child: Consumer(
                        builder: (BuildContext context,
                            ScreenHomeProvider value, Widget? child) {
                          // return value.isLoading
                          // ? const Center(
                          //     child: CircularProgressIndicator(),
                          //   )
                          return value.isLoading
                              ? Shimmerwidget(
                                  height: 150,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    );
                                  },
                                  itemCount: 1,
                                )
                              : ListView.builder(
                                  itemCount: value.categoryList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final category = value.categoryList[index];
                                    return Row(
                                      children: [
                                        HomeCategoriesWidget(
                                          image: category?.image.toString() ??
                                              'https://images.hasgeek.com/embed/file/65c4929262a84c78b29ad37321df2eca',
                                          title:
                                              category!.categoryName.toString(),
                                        ),
                                        AppSpacing.ksizedBoxW25,
                                      ],
                                    );
                                  },
                                );
                        },
                      ),
                    ),
                    AppSpacing.ksizedBox10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Special Offer',
                          style: AppTextStyle.kTextBlack20Size,
                        ),
                      ],
                    ),
                    AppSpacing.ksizedBox5,
                    const CarouselCardWidget(),
                    AppSpacing.ksizedBox20,
                    Row(
                      children: [
                        const Text(
                          'Latest Products',
                          style: AppTextStyle.kTextBlack20Size,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            data.navigatorHomeToViewAll(context);
                          },
                          child: const Text(
                            'View All',
                            style: AppTextStyle.kTextBlack20Size,
                          ),
                        )
                      ],
                    ),
                    AppSpacing.ksizedBox10,
                    Consumer(
                      builder: (context, ScreenHomeProvider value, child) {
                        return value.isLoading
                            // ? const CircularProgressIndicator()

                            ? Shimmerwidget(
                                height: 150,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  );
                                },
                                itemCount: 1,
                              )
                            : ProductViewWidget(
                                list: value.product?.products ?? [],
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
