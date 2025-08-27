import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_text_field.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Create Account", style: AppStyle.styleBold32),
          SizedBox(height: 16),
          CustomTextfield(text: "First Name"),
          SizedBox(height: 16),
          CustomTextfield(text: "Last Name"),
          SizedBox(height: 16),
          CustomTextfield(text: "Email Address"),
          SizedBox(height: 16),
          CustomTextfield(text: "Password"),
          SizedBox(height: 32),
          CustomButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kGenderAndAgeView);
            },
            title: "Continue",
          ),
          SizedBox(height: 32),
          CustomText(
            tex1: "Do you hava an account ? ",
            tex2: "Login",
            ontap: () => GoRouter.of(context).push(AppRouter.KLoginView),
          ),
        ],
      ),
    );
  }
}
