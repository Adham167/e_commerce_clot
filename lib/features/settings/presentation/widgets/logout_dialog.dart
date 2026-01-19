import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/settings/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key, required this.logoutCubit});
  final LogoutCubit logoutCubit;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.background,
      title: const Text(
        "Are you sure about logout? ",
        style: AppStyle.styleBold24,
      ),
      actions: [
        TextButton(
          onPressed: () {
            logoutCubit.logout();
            GoRouter.of(context).pop();
          },
          child: Text(
            "Yes",
            style: AppStyle.styleBold16.copyWith(color: AppColors.primary),
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: Text(
            "No",
            style: AppStyle.styleBold16.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
