import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/settings/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:e_commerce_clot/features/settings/presentation/widgets/settings_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogOutBlocListener extends StatelessWidget {
  const LogOutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutFailure) {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text(
                    state.errMessage,
                    style: AppStyle.styleBold24.copyWith(color: AppColors.red),
                  ),
                ),
          );
        }

        if (state is LogoutLoading) {
          showDialog(
            context: context,
            builder:
                (_) => const AlertDialog(
                  backgroundColor: AppColors.background,

                  actions: [
                    SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
          );
          Future.delayed(const Duration(seconds: 3));
        }

        if (state is LogoutSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.KLoginView);
        }
      },
      child: const SettingsBody(),
    );
  }
}
