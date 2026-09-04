import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/forgot_password_bloc_listener.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Forgot Password",
              style: AppStyle.styleBold32,
            ),

             SizedBox(height: 20),

             ForgotPasswordBlocListener(),
          ],
        ),
      ),
    );
  }
}