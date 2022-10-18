import 'package:ecommerse/core/constents.dart';
import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'New Inspiration',
                style: ConstentsItems.kTextsize16,
              ),
              const Text(
                'CLOTHING MADE\nFOR YOU!',
                style: ConstentsItems.kTextBlack20Size,
              ),
              Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text('Shope Now',
                      style: TextStyle(color: ConstentsItems.kWhiteColor)),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 183, 214, 224).withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: const [
                Text(
                  '50%\nOff',
                  style: ConstentsItems.kTextBlack50Size,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
