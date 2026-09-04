import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          GoRouter.of(
            context,
          ).pushReplacement(AppRouter.kEmailVerificationView);
        }

        if (state is SignUpFailure) {
          _showErrorDialog(context, state.errMessage);
        }
      },
      child: const SignUpForm(),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.error_outline_rounded, color: AppColors.red, size: 28),
              SizedBox(width: 10),
              Text('Registration Failed'),
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
