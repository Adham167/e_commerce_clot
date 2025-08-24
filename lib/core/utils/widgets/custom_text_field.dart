import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(decoration: InputDecoration(hintText: text));
  }
}