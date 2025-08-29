import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/assets.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetBody extends StatelessWidget {
  const ResetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.imagesMessageIcon),
            const SizedBox(height: 24),
            const Text(
              "We Sent you an Email to reset your password.",
              textAlign: TextAlign.center,
              style: AppStyle.styleMedium24,
            ),
            const SizedBox(height: 24),
            CustomButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.KLoginView);
              },
              title: "Return to Login",
              width: 160,
            ),
          ],
        ),
      ),
    );
  }
}
