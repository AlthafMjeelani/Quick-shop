import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmerwidget extends StatelessWidget {
  const Shimmerwidget({
    Key? key,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);
  final double height;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
          shrinkWrap: true, itemCount: itemCount, itemBuilder: itemBuilder),
    );
  }
}

