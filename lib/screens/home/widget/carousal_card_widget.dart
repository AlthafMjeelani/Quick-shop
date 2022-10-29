import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/home/widget/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarouselCardWidget extends StatelessWidget {
  const CarouselCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenHomeProvider>(context,listen: false);
    return CarouselSlider.builder(
      carouselController:data.carouselController ,
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.23,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage('assets/images/shopping 1.webp'),
              fit: BoxFit.fill,
              opacity: 0.7,
            ),
          ),
          child: const HomeCardWidget(),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: true,
        viewportFraction: 1.0,
      ),
    );
  }
}
