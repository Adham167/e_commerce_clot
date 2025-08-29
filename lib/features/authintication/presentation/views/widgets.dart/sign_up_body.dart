import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_text_field.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody({super.key});

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _LastName = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create Account", style: AppStyle.styleBold32),
            const SizedBox(height: 16),
            CustomTextfield(text: "First Name", controller: _firstName),
            const SizedBox(height: 16),
            CustomTextfield(text: "Last Name", controller: _LastName),
            const SizedBox(height: 16),
            CustomTextfield(text: "Email Address", controller: _emailAddress),
            const SizedBox(height: 16),
            CustomTextfield(text: "Password", controller: _password),
            const SizedBox(height: 32),
            CustomButton(
              onPressed: () {
                final user = UserModel(
                  firstName: _firstName.text,
                  lastName: _LastName.text,
                  eamil: _emailAddress.text,
                  password: _password.text,
                );
                GoRouter.of(
                  context,
                ).push(AppRouter.kGenderAndAgeView, extra: user);
              },
              title: "Continue",
            ),
            const SizedBox(height: 32),
            CustomText(
              tex1: "Do you hava an account ? ",
              tex2: "Login",
              ontap: () => GoRouter.of(context).push(AppRouter.KLoginView),
            ),
          ],
        ),
      ),
    );
  }
}
