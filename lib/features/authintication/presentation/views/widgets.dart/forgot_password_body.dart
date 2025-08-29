import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_reactive_button.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_text_field.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/button_cubit/button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordBody extends StatelessWidget {
  ForgotPasswordBody({super.key});
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          } else if (state is ButtonSuccess) {
            GoRouter.of(context).pushReplacement(AppRouter.kResetPasswordView);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Forgot Password", style: AppStyle.styleBold32),
              const SizedBox(height: 20),
              CustomTextfield(text: "Enter Email Address", controller: _email),

              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  return CustomReactiveButton(
                    onPressed: () {
                      BlocProvider.of<ButtonCubit>(context).execute(
                        usecase: SendPasswordResetEmailUsecase(),
                        params: _email.text.trim(),
                      );
                    },
                    title: "Continue",
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
