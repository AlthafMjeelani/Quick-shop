import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenOrderSummay extends StatelessWidget {
  const ScreenOrderSummay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('Order Summary'),
        ),
      ],
    );
  }
}
