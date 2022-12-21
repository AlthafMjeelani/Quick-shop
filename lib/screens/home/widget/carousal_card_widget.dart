import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/home/widget/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:provider/provider.dart';

class CarouselCardWidget extends StatelessWidget {
  const CarouselCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider =
        Provider.of<ScreenHomeProvider>(context, listen: false);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.275,
      child: Consumer(
        builder: (context, ScreenHomeProvider value, child) {
          return value.isLoading
              ? const SizedBox()
              : value.carouselModel == null
                  ? const SizedBox()
                  : value.carouselModel!.carousals!.isEmpty
                      ? const Center(
                          child: Text(
                            'No Categories',
                            style: AppTextStyle.kTextBlack16Bold,
                          ),
                        )
                      : CarouselSlider.builder(
                          enableAutoSlider: true,
                          unlimitedMode: true,
                          slideIndicator: CircularSlideIndicator(
                            currentIndicatorColor: Colors.blue,
                            itemSpacing: 25,
                            indicatorRadius: 7,
                            padding: const EdgeInsets.only(bottom: 12),
                          ),
                          itemCount: value.carouselModel!.carousals!.length,
                          slideBuilder: (index) {
                           final carousel =
                                homeProvider.carouselModel!.carousals![index];
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.23,
                                width: MediaQuery.of(context).size.width * 0.90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image:  DecorationImage(
                                    image: NetworkImage(
                                        carousel.image!),
                                    fit: BoxFit.fill,
                                    opacity: 0.7,
                                  ),
                                ),
                                child: HomeCardWidget(
                                  discription: carousel.description!,
                                  offer: carousel.offer.toString(),
                                  title: carousel.title!,
                                ),
                              ),
                            );
                          },
                        );
        },
      ),
    );
  }
}
