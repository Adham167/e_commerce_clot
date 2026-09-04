import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/custom_text.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),

            const Text(
              "Create Account",
              style: AppStyle.styleBold32,
            ),

            const SizedBox(height: 16),

            const SignUpBlocListener(),

            const SizedBox(height: 10),

            CustomText(
              tex1: "Already have an account? ",
              tex2: "Login",
              ontap: () {
                GoRouter.of(context).pushReplacement(
                  AppRouter.kLoginView,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}