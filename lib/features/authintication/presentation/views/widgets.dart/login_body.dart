import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/custom_text.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sign In", style: AppStyle.styleBold32),
          SizedBox(height: 16),
          CustomTextfield(text: "Enter Email"),
          SizedBox(height: 16),
          CustomTextfield(text: "Enter Password"),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: CustomText(
              tex1: "Forgot Password? ",
              tex2: "Reset",
              ontap: () {
                GoRouter.of(context).push(AppRouter.KForgotPassword);
              },
            ),
          ),
          SizedBox(height: 20),
          CustomButton(onPressed: () {}, title: "Continue"),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: CustomText(
              tex1: "Don't have an Account? ",
              tex2: "Create One",
              ontap: () {
                GoRouter.of(context).push(AppRouter.KSignupView);
              },
            ),
          ),
        ],
      ),
    );
  }
}
