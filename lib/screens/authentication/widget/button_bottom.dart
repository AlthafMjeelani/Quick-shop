import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class ButtonBottomSide extends StatelessWidget {
  const ButtonBottomSide({
    Key? key,
    this.onTap,
    required this.text,
    required this.richText,
    required this.height,
  }) : super(key: key);
  final void Function()? onTap;
  final String text;
  final String richText;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: Divider(
                thickness: 2,
              ),
            ),
            AppSpacing.ksizedBoxW5,
            Center(
              child: Text('Or Continue With'),
            ),
            AppSpacing.ksizedBoxW5,
            Expanded(
              child: Divider(
                thickness: 2,
              ),
            ),
          ],
        ),
        AppSpacing.ksizedBox20,
        SignInButton(
          buttonType: ButtonType.google,
          buttonSize: ButtonSize.large, // small(default), medium, large
          onPressed: () {},
        ),
        SizedBox(
          height: height,
        ),
        RichText(
          text: TextSpan(
            text: text,
            children: [
              TextSpan(
                text: richText,
                style: const TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ],
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
