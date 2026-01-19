import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.text, this.controller});
  final String text;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppStyle.styleMedium16,
      decoration: InputDecoration(hintText: text),
    );
  }
}
