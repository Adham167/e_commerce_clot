import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordBlocListener extends StatelessWidget {
  const ForgotPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          GoRouter.of(context).pushReplacement(
            AppRouter.kResetPasswordView,
          );
        }

        if (state is ForgotPasswordFailure) {
          _showErrorDialog(
            context,
            state.errMessage,
          );
        }
      },
      child: const ForgotPasswordForm(),
    );
  }

  void _showErrorDialog(
    BuildContext context,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.error_outline_rounded,
                color: AppColors.red,
                size: 28,
              ),
              SizedBox(width: 10),
              Text('Request Failed'),
            ],
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Try Again'),
            ),
          ],
        );
      },
    );
  }
}