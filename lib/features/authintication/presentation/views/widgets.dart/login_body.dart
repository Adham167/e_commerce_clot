import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/assets.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/custom_text.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/login_bloc_listener.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/other_login_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text("Sign In", style: AppStyle.styleBold32),
            const SizedBox(height: 16),
            const LoginBlocListener(),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomText(
                tex1: "Don't have an Account? ",
                tex2: "Create One",
                ontap: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kSignupView);
                },
              ),
            ),
            const SizedBox(height: 64),
            const OtherLoginMethodWidget(
              icon: Assets.imagesApple,
              name: "Continue With Apple",
            ),
            const SizedBox(height: 8),
            const OtherLoginMethodWidget(
              icon: Assets.imagesGoogle,
              name: "Continue With Google",
            ),
            const SizedBox(height: 8),
            const OtherLoginMethodWidget(
              icon: Assets.imagesFacebook,
              name: "Continue With Facebook",
            ),
          ],
        ),
      ),
    );
  }
}
