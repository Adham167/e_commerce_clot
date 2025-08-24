import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.tex1, required this.tex2, this.ontap});
  final String tex1;
  final String tex2;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [TextSpan(text: tex1,style: AppStyle.styleRegular12), 
      TextSpan(text: tex2,
      recognizer: TapGestureRecognizer()..onTap=ontap,
      style: AppStyle.styleRegularBold12)]),
    );
  }
}
