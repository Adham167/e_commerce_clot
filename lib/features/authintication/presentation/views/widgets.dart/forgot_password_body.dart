import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Forgot Password", style: AppStyle.styleBold32),
          SizedBox(height: 20),
          CustomTextfield(text: "Enter Email Address"),
          
          SizedBox(height: 20),
          CustomButton(onPressed: () {}, title: "Continue"),
          SizedBox(height: 10),
          
        ],
      ),
    );
  }
}