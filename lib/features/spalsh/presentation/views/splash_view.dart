import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/features/spalsh/presentation/manager/splash_cubit/splash_cubit.dart';
import 'package:e_commerce_clot/features/spalsh/presentation/views/widgets/splash_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            GoRouter.of(context).pushReplacement(AppRouter.KLoginView);
          } else if (state is Authenticated) {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          }
        },
        child: SplashBody(),
      ),
    );
  }
}
