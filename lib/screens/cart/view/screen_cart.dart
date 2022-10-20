import 'package:ecommerse/core/constents.dart';
import 'package:flutter/material.dart';

class ScreeCart extends StatelessWidget {
  const ScreeCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: ConstentsItems.kBgColor,
        ),
        child: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return const ListTile();
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: 10),
        ),
      ),
    );
  }
}
