import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title,  this.width,  this.height, this.content});
  final VoidCallback onPressed;
  final String title;
  final double? width;
  final double? height;
  final Widget? content;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height?? 50)
      ),
      child: content ?? Text(title,style: AppStyle.styleMedium16,));
  }
}
