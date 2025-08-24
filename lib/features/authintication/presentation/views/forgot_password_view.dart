import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/forgot_password_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(), body: ForgotPasswordBody());
  }
}
