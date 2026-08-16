import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_text_field.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text("Create Account", style: AppStyle.styleBold32),
            const SizedBox(height: 32),

            CustomTextfield(text: "First Name", controller: _firstName),
            const SizedBox(height: 16),

            CustomTextfield(text: "Last Name", controller: _lastName),
            const SizedBox(height: 16),

            CustomTextfield(text: "Email Address", controller: _emailAddress),
            const SizedBox(height: 16),

            CustomTextfield(
              text: "Password",
              controller: _password,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primary,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordHidden = !_isPasswordHidden;
                  });
                },
              ),
            ),

            const SizedBox(height: 32),

            CustomButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                Future.delayed(const Duration(microseconds: 200));
                final user = UserModel(
                  firstName: _firstName.text,
                  lastName: _lastName.text,
                  eamil: _emailAddress.text,
                  password: _password.text,
                );

                GoRouter.of(
                  context,
                ).push(AppRouter.kGenderAndAgeView, extra: user);
              },
              title: "Continue",
            ),

            const SizedBox(height: 8),

            CustomText(
              tex1: "Do you hava an account ? ",
              tex2: "Login",
              ontap:
                  () => GoRouter.of(
                    context,
                  ).pushReplacement(AppRouter.kLoginView),
            ),
          ],
        ),
      ),
    );
  }
}
kjljnl