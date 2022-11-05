import 'package:flutter/material.dart';

class RowTowItemWidget extends StatelessWidget {
  const RowTowItemWidget({
    Key? key,
    required this.title1,
    required this.title2,
  }) : super(key: key);

  final Widget title1;
  final Widget title2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        title1,
        const Spacer(),
        title2,
      ],
    );
  }
}
