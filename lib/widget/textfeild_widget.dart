import 'package:flutter/material.dart';

class TextfeildWidget extends StatelessWidget {
  const TextfeildWidget({
    Key? key,
    this.validator,
    required this.text,
    this.icon,
    this.controller,
    this.keyboardType,
    this.suffixIcon,
    required this.obscureText,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final String text;
  final IconData? icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(text),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
